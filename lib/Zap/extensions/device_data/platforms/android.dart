// ignore_for_file: constant_identifier_names, unused_element

part of '../device_info.dart';

/// An enumeration representing different types of network connections.
enum ConnectionType {
  /// Represents a Wi-Fi network connection.
  WIFI,

  /// Represents a mobile data network connection.
  MOBILE,

  /// Represents no active network connection.
  NONE,
}

/// A class representing device information.
class _Android {
  /// Retrieves all device information asynchronously.

  /// Initializes and retrieves device information asynchronously.
  ///
  /// This function uses a platform channel to invoke the 'getAllAndroid'
  /// method and retrieves a Map containing device information from the native
  /// side. It then constructs a [Android] object by parsing the received data
  /// and returns it.
  ///
  /// Returns a [Android] object containing details about the device.
   Future<_Android> initAndroid() async {
    // Establishes communication with the native side using a platform channel.
    const platform = MethodChannel('ZapChannel');

    // Invokes the 'getAllAndroid' method to retrieve device information.
    Map result = await platform.invokeMethod('getAllAndroid');
    Map resultnetwork = await platform.invokeMethod('networkInfo');
    result.addAll(resultnetwork);
    // Constructs a [Android] object by parsing the received data.
    return _Android.fromJson(result);
  }

  /// The model of the device.
  String? model;

  /// The brand of the device.
  String? brand;

  /// The manufacturer of the device.
  String? manufacturer;

  /// The product name of the device.
  String? product;

  /// The hardware specification of the device.
  String? hardware;

  /// The serial number of the device.
  String? serial;

  /// The Android version of the device.
  String? androidVersion;

  /// The code name of the Android version.
  String? versionCodeName;

  /// The incremental version of the Android build.
  String? versionIncremental;

  /// The SDK version of the Android build.
  String? versionSdk;

  /// The device temperature in degrees Celsius.
  double? deviceTemperature;

  /// The type of network connection the device is currently using.
  ///
  /// Note: Ensure that the 'android.permission.ACCESS_NETWORK_STATE' permission
  /// is added to the AndroidManifest.xml file for accurate network connection
  /// information.
  ConnectionType? connectionType;

  /// Indicates whether the device is currently connected to a network.
  ///
  /// Note: Ensure that the 'android.permission.ACCESS_NETWORK_STATE' permission
  /// is added to the AndroidManifest.xml file for accurate network connection
  /// information.
  bool? isConnected;

  /// The SSID (Service Set Identifier) of the connected Wi-Fi network.
  String? wifiSSID;

  /// The BSSID (Basic Service Set Identifier) of the connected Wi-Fi network.
  String? wifiBSSID;

  /// The IP address of the device on the network.
  String? ipAddress;

  /// The MAC (Media Access Control) address of the Wi-Fi interface.
  String? macAddress;

  /// The link speed of the Wi-Fi connection in Mbps.
  int? linkSpeed;

  /// The ID of the connected Wi-Fi network.
  int? networkId;

  /// Indicates whether the SSID of the Wi-Fi network is hidden.
  bool? hiddenSSID;

  /// Indicates whether Wi-Fi is enabled on the device.
  bool? isWifiEnabled;

  /// Indicates whether the 5GHz band is supported on the device.
  bool? is5GHzBandSupported;

  _Android(
      {this.model,
      this.brand,
      this.manufacturer,
      this.product,
      this.hardware,
      this.serial,
      this.androidVersion,
      this.versionCodeName,
      this.versionIncremental,
      this.versionSdk,
      this.deviceTemperature,
      this.connectionType,
      this.isConnected,
      this.hiddenSSID,
      this.ipAddress,
      this.is5GHzBandSupported,
      this.isWifiEnabled,
      this.linkSpeed,
      this.macAddress,
      this.networkId,
      this.wifiBSSID,
      this.wifiSSID});

  /// Constructs a [Android] object from a JSON map.
  _Android.fromJson(Map<dynamic, dynamic> json) {
    model = json['model'];
    brand = json['brand'];
    deviceTemperature = json['deviceTemperature'];
    manufacturer = json['manufacturer'];
    product = json['product'];
    hardware = json['hardware'];
    serial = json['serial'];
    androidVersion = json['versionRelease'];
    versionCodeName = json['versionCodeName'];
    versionIncremental = json['versionIncremental'];
    versionSdk = json['versionSdkInt'].toString();
    isConnected = json['isConnected'];
    connectionType = _parseConnectionType(json['connectionType']);
    wifiSSID = json['wifiSSID'];
    wifiBSSID = json['wifiBSSID'];
    ipAddress = json['ipAddress'].toString();
    macAddress = json['macAddress'].toString();
    linkSpeed = json['linkSpeed'];
    networkId = json['networkId'];
    hiddenSSID = json['hiddenSSID'];
    isWifiEnabled = json['isWifiEnabled'];
    is5GHzBandSupported = json['is5GHzBandSupported'];
  }

  /// Parses the connection type from a string representation.
  ConnectionType? _parseConnectionType(String? value) {
    if (value == 'WIFI') {
      return ConnectionType.WIFI;
    } else if (value == 'MOBILE') {
      return ConnectionType.MOBILE;
    } else if (value == 'NONE') {
      return ConnectionType.NONE;
    } else {
      return null;
    }
  }
}
