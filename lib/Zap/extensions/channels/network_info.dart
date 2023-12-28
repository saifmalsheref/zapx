part of 'package:zapx/Zap/nav_main.dart';

/// A class representing network information.
class NetworkInfo {
  ///
  /// Note: Ensure that the 'android.permission.ACCESS_WIFI_STATE' permission
  /// Retrieves network information asynchronously.
  static Future<NetworkInfo> initNetworkInfo() async {
    // Establishes communication with the native side using a platform channel.
    const platform = MethodChannel('ZapChannel');

    // Invokes the 'networkInfo' method to retrieve network information.
    Map result = await platform.invokeMethod('networkInfo');

    // Constructs a [NetworkInfo] object by parsing the received data.
    return NetworkInfo.fromJson(result);
  }

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

  /// The type of network connection the device is currently using.
  ConnectionType? connectionType;

  /// Constructs a [NetworkInfo] object from a JSON map.
  NetworkInfo.fromJson(Map<dynamic, dynamic> json) {
    wifiSSID = json['wifiSSID'];
    wifiBSSID = json['wifiBSSID'];
    ipAddress = json['ipAddress'].toString();
    macAddress = json['macAddress'].toString();
    linkSpeed = json['linkSpeed'];
    networkId = json['networkId'];
    hiddenSSID = json['hiddenSSID'];
    isWifiEnabled = json['isWifiEnabled'];
    is5GHzBandSupported = json['is5GHzBandSupported'];
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
