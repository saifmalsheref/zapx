import 'package:flutter/material.dart';
import 'package:zapx/Zap/extensions/zap_store.dart';
import 'package:zapx/Zap/extensions/zap_translate.dart';
import 'package:zapx/Zap/nav_main.dart';
import 'package:zapx/Zap/widgets/zap_material_app.dart';
import 'package:zapx/zapx.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return XMaterialApp(
      // XMaterialApp is assumed to be part of MaterialApp based on the provided information
      translationsKeys: TranslationController.Translation,
      locale: Locale("ar"),
      home: MyHomePage(),
    );
  }
}

class TranslationController {
  static Map<String, Map<String, String>> Translation = {
    "ar": {
      "hello": "مرحبا",
    },
    "en": {"hello": "Hello"}
  };
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('hello'.ztr), // مرحبا
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Welcome to ZapX'),
            SizedBox(height: 20),
            Text('This is your home page.'),
            ElevatedButton(
                onPressed: () {
                  Zap.to(Container(), transition: Transition.leftToRight);
                },
                child: Text("push page with Transition")),
            Text("dark mode ${Zap.isDarkMode}"),
            Text("locale of the app ${Zap.locale?.languageCode}"),
            Text("system locale of the device ${Zap.systemLocale}"),
            Text("height of the device screen ${Zap.height}"),
            Text("width of the device screen ${Zap.width}"),
            Text("height of the device's status bar ${Zap.statusBarHeight}"),
          ],
        ),
      ),
    );
  }

  void usingContext() {
    ScaffoldMessenger.of(Zap.context)
        .showSnackBar(SnackBar(content: Text("Zap context")));
  }

  void isValidator(String text) {
    bool emailValidator = Zap.isValidEmail(text);
    bool passwordValidator = Zap.isValidPassword(text,
        minLength: 5,
        requireDigit: true,
        requireSpecialChar: false,
        requireUppercase: true);
    bool phoneValidator = Zap.isValidPhoneNumber(
      text,
    );
    bool urlValid = Zap.isValidUrl(text, validSchemes: ["http", "https"]);
  }

  /// Retrieves mobile device information asynchronously.
  ///
  /// This method fetches various details about the Android device
  /// Note: To get accurate network information, ensure that the following
  /// permissions are added to the AndroidManifest.xml file:
  /// - 'android.permission.ACCESS_NETWORK_STATE'
  ///
  /// Usage Example:

  Future getMobileInfo() async {
    var deviceInfo = await Zap.deviceInfo;

    // Print all available device information
    print('Model: ${deviceInfo.model}');
    print('Brand: ${deviceInfo.brand}');
    print('Manufacturer: ${deviceInfo.manufacturer}');
    print('Product: ${deviceInfo.product}');
    print('Hardware: ${deviceInfo.hardware}');
    print('Serial: ${deviceInfo.serial}');
    print('Android Version: ${deviceInfo.androidVersion}');
    print('Version Code Name: ${deviceInfo.versionCodeName}');
    print('Version Incremental: ${deviceInfo.versionIncremental}');
    print('SDK Version: ${deviceInfo.versionSdk}');
    print('Device Temperature: ${deviceInfo.deviceTemperature}');
    print('Connection Type: ${deviceInfo.connectionType}');
    print('Is Connected: ${deviceInfo.isConnected}');
  }

  /// Retrieves network information asynchronously.
  ///
  /// This method fetches details about the Connection data
  /// Note: Ensure that the 'android.permission.ACCESS_WIFI_STATE' permission
  /// is added to the AndroidManifest.xml file for accurate Wi-Fi information.
  ///
  /// Usage Example:

  Future getNetworkInfo() async {
    var networkInfo = await Zap.networkInfo;

    // Print all available network information
    print('Wi-Fi SSID: ${networkInfo.wifiSSID}');
    print('Wi-Fi BSSID: ${networkInfo.wifiBSSID}');
    print('IP Address: ${networkInfo.ipAddress}');
    print('MAC Address: ${networkInfo.macAddress}');
    print('Link Speed: ${networkInfo.linkSpeed} Mbps');
    print('Network ID: ${networkInfo.networkId}');
    print('Hidden SSID: ${networkInfo.hiddenSSID}');
    print('Wi-Fi Enabled: ${networkInfo.isWifiEnabled}');
    print('5GHz Band Supported: ${networkInfo.is5GHzBandSupported}');
    print('Connection Type: ${networkInfo.connectionType}');
  }

  /// Saves data using the [ZapStore] class methods.
  Future<void> saveData() async {
    // Update the value associated with the key.
    await ZapStore.update("key", "newValue");

    // Retrieve the value associated with the key.
    dynamic? retrievedValue = await ZapStore.get("key");

    // Delete the key-value pair.
    await ZapStore.delete("key");

    // Insert a new key-value pair.
    await ZapStore.insert("key", "value");
  }

  /// Example usage of the ZapNavigation functions.
  void ZapNavigationExample() {
    // Navigate to a new page (MyHomePage) with default transition
    Zap.to(MyHomePage(),
        transition: Transition.native,
        allowSnapshotting: true,
        transitionDuration: Duration(milliseconds: 300),
        reverseTransitionDuration: Duration(milliseconds: 300),
        opaque: true);

    // Navigate to a named route ('/details') with arguments and default transition
    Zap.toNamed(
      '/details',
      arguments: {'id': 123},
    );

    // Pop the current route from the Navigator stack with default transition
    Zap.back();

    // Replace the current page with a new one (MyHomePage) with default transition
    Zap.off(MyHomePage(),
        transition: Transition.native,
        allowSnapshotting: true,
        transitionDuration: Duration(milliseconds: 300),
        reverseTransitionDuration: Duration(milliseconds: 300),
        opaque: true);

    // Replace the entire Navigator stack with a new page (MyHomePage) with default transition
    Zap.offAll(MyHomePage(),
        transition: Transition.native,
        allowSnapshotting: true,
        transitionDuration: Duration(milliseconds: 300),
        reverseTransitionDuration: Duration(milliseconds: 300),
        opaque: true);

    // Replace the current named route with a new one ('/home') with default transition
    Zap.offNamed(
      '/home',
    );

    // Replace the entire Navigator stack with a new named route ('/home') with default transition
    Zap.offAllNamed(
      '/home',
    );
  }
}
