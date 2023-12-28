// ignore_for_file: constant_identifier_names

part of 'package:zapx/Zap/nav_main.dart';

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
class DeviceInfo {
  /// Retrieves all device information asynchronously.

  /// Initializes and retrieves device information asynchronously.
  ///
  /// This function uses a platform channel to invoke the 'getAllDeviceInfo'
  /// method and retrieves a Map containing device information from the native
  /// side. It then constructs a [DeviceInfo] object by parsing the received data
  /// and returns it.
  ///
  /// Returns a [DeviceInfo] object containing details about the device.
  static Future<DeviceInfo> initDeviceInfo() async {
    // Establishes communication with the native side using a platform channel.
    const platform = MethodChannel('ZapChannel');

    // Invokes the 'getAllDeviceInfo' method to retrieve device information.
    Map result = await platform.invokeMethod('getAllDeviceInfo');

    // Constructs a [DeviceInfo] object by parsing the received data.
    return DeviceInfo.fromJson(result);
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

  DeviceInfo({
    this.model,
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
  });

  /// Constructs a [DeviceInfo] object from a JSON map.
  DeviceInfo.fromJson(Map<dynamic, dynamic> json) {
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
