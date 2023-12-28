package com.example.zapx

import android.annotation.TargetApi
import android.content.Context
import android.net.ConnectivityManager
import android.os.Build
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import java.util.*
import android.hardware.Sensor
import android.hardware.SensorEvent
import android.hardware.SensorEventListener
import android.hardware.SensorManager
import android.net.NetworkCapabilities
import android.net.wifi.WifiInfo
import android.net.wifi.WifiManager



class MainActivity : FlutterActivity() {
    private val CHANNEL = "ZapChannel"

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNEL).setMethodCallHandler { call: MethodCall, result: MethodChannel.Result ->
            when (call.method) {

                "getAllDeviceInfo" -> {
                    val allDeviceInfo = getAllDeviceInfo()
                    result.success(allDeviceInfo)
                } "networkInfo" -> {
                    val networkInfo = getNetworkInfo(context)
                result.success(networkInfo)
                }
                else -> {
                    result.notImplemented()
                }
            }
        }
    }

    private fun isNetworkConnected(): Boolean {
        val connectivityManager = getSystemService(Context.CONNECTIVITY_SERVICE) as ConnectivityManager
        val activeNetwork = connectivityManager.activeNetworkInfo
        return activeNetwork?.isConnectedOrConnecting == true
    }

    private fun getConnectionType(): String {
        val connectivityManager = getSystemService(Context.CONNECTIVITY_SERVICE) as ConnectivityManager
        val activeNetwork = connectivityManager.activeNetworkInfo
        return activeNetwork?.typeName ?: "Unknown"
    }



    @TargetApi(Build.VERSION_CODES.CUPCAKE)
    fun getDeviceTemperature(context: Context): Float? {
        val sensorManager = context.getSystemService(Context.SENSOR_SERVICE) as SensorManager
        val temperatureSensor = sensorManager.getDefaultSensor(Sensor.TYPE_AMBIENT_TEMPERATURE)

        if (temperatureSensor == null) {
            return null // Sensor not available
        }

        var temperature: Float? = null

        val listener = @TargetApi(Build.VERSION_CODES.CUPCAKE)
        object : SensorEventListener {
            override fun onSensorChanged(event: SensorEvent?) {
                if (event?.sensor?.type == Sensor.TYPE_AMBIENT_TEMPERATURE) {
                    temperature = event.values[0]
                    sensorManager.unregisterListener(this) // Unregister once we have a reading
                }
            }

            override fun onAccuracyChanged(p0: Sensor?, p1: Int) {
                TODO("Not yet implemented")
            }

        }

        sensorManager.registerListener(listener, temperatureSensor, SensorManager.SENSOR_DELAY_NORMAL)

        return temperature // Return the temperature reading, or null if not available
    }
    @TargetApi(Build.VERSION_CODES.FROYO)
    private fun getAllDeviceInfo(): Map<String, Any> {
        val brand = Build.BRAND
        val manufacturer = Build.MANUFACTURER
        val product = Build.PRODUCT
        val hardware = Build.HARDWARE
        val serial = if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.GINGERBREAD) {
            Build.SERIAL
        } else {
            TODO("VERSION.SDK_INT < GINGERBREAD")
        }
        val versionRelease = Build.VERSION.RELEASE
        val versionCodeName = Build.VERSION.CODENAME
        val versionIncremental = Build.VERSION.INCREMENTAL
        val versionSdkInt = Build.VERSION.SDK_INT

        val isConnected = isNetworkConnected()
        val connectionType = getConnectionType()
        val deviceTemperature = getDeviceTemperature(context) ?: 0.0f
        return mapOf(
            "model" to Build.MODEL,
            "brand" to brand,
            "manufacturer" to manufacturer,
            "product" to product,
            "hardware" to hardware,
            "serial" to serial,
            "deviceTemperature" to deviceTemperature,
            "versionRelease" to versionRelease,
            "versionCodeName" to versionCodeName,
            "versionIncremental" to versionIncremental,
            "versionSdkInt" to versionSdkInt,
            "isConnected" to isConnected,
            "connectionType" to connectionType,
            // Add any other device information you want to include
        )
    }


    // network information
    @TargetApi(Build.VERSION_CODES.LOLLIPOP)
    fun getNetworkInfo(context: Context): Map<String, Any> {
        val networkInfo = mutableMapOf<String, Any>()

        val connectivityManager = context.getSystemService(Context.CONNECTIVITY_SERVICE) as ConnectivityManager
        val activeNetwork = connectivityManager.activeNetwork
        val networkCapabilities = connectivityManager.getNetworkCapabilities(activeNetwork)

        if (networkCapabilities != null) {
            when {
                networkCapabilities.hasTransport(NetworkCapabilities.TRANSPORT_WIFI) -> {
                    // Connected to Wi-Fi
                    networkInfo["connectionType"] = "WIFI"

                    val wifiManager = context.getSystemService(Context.WIFI_SERVICE) as WifiManager
                    val wifiInfo: WifiInfo = wifiManager.connectionInfo

                    networkInfo["wifiSSID"] = wifiInfo.ssid
                    networkInfo["wifiBSSID"] = wifiInfo.bssid
                    networkInfo["wifiIpAddress"] = convertIpAddressToString(wifiInfo.ipAddress)
                    networkInfo["wifiMacAddress"] = wifiInfo.macAddress
                    networkInfo["linkSpeed"] = wifiInfo.linkSpeed
                    networkInfo["networkId"] = wifiInfo.networkId
                    if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.Q) {
                        networkInfo["txLinkSpeedMbps"] = wifiInfo.txLinkSpeedMbps
                    }else{networkInfo["txLinkSpeedMbps"] = "{{ requires API level 29 }}"}
                    networkInfo["hiddenSSID"] = wifiInfo.hiddenSSID
                    networkInfo["isWifiEnabled"] =wifiManager.isWifiEnabled
                    networkInfo["is5GHzBandSupported"] =wifiManager.is5GHzBandSupported


                    //
                    // Add more Wi-Fi related information if needed
                }
                networkCapabilities.hasTransport(NetworkCapabilities.TRANSPORT_CELLULAR) -> {
                    // Connected to mobile network
                    networkInfo["connectionType"] = "MOBILE"
                    // Add more mobile network related information if needed
                }
                else -> {
                    // Other connection types
                    networkInfo["connectionType"] = "OTHER"
                }
            }
        } else {
            // No active network
            networkInfo["connectionType"] = "NONE"
        }

        return networkInfo
    }

    private fun convertIpAddressToString(ipAddress: Int): String {
        return (ipAddress and 0xFF).toString() + "." +
                ((ipAddress shr 8) and 0xFF).toString() + "." +
                ((ipAddress shr 16) and 0xFF).toString() + "." +
                ((ipAddress shr 24) and 0xFF).toString()
    }

}
