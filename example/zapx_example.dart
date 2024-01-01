// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';
import 'package:zapx/Zap/extensions/device_data/device_info.dart';
import 'package:zapx/Zap/extensions/device_data/platforms/web.dart';
import 'package:zapx/Zap/extensions/zap_store.dart';
import 'package:zapx/Zap/extensions/zap_translate.dart';
import 'package:zapx/Zap/zapx.dart';

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

  /// Retrieves mobile device information and Retrieves network information asynchronously.
  ///
  /// This method fetches various details about the Android device
  /// Note: To get accurate network information, ensure that the following
  /// permissions are added to the AndroidManifest.xml file:
  /// - 'android.permission.ACCESS_NETWORK_STATE' - 'android.permission.ACCESS_WIFI_STATE'
  ///
  /// Usage Example:

  Future getAndroidInfo() async {
    var androidData = await Zap.deviceInfo.android;

    // Print all available device information
    print('Model: ${androidData.model}');
    print('Brand: ${androidData.brand}');
    print('Manufacturer: ${androidData.manufacturer}');
    print('Product: ${androidData.product}');
    print('Hardware: ${androidData.hardware}');
    print('Serial: ${androidData.serial}');
    print('Android Version: ${androidData.androidVersion}');
    print('Version Code Name: ${androidData.versionCodeName}');
    print('Version Incremental: ${androidData.versionIncremental}');
    print('SDK Version: ${androidData.versionSdk}');
    print('Device Temperature: ${androidData.deviceTemperature}');
    // Print all available network information
    print('Wi-Fi SSID: ${androidData.wifiSSID}');
    print('Wi-Fi BSSID: ${androidData.wifiBSSID}');
    print('IP Address: ${androidData.ipAddress}');
    print('MAC Address: ${androidData.macAddress}');
    print('Link Speed: ${androidData.linkSpeed} Mbps');
    print('Network ID: ${androidData.networkId}');
    print('Hidden SSID: ${androidData.hiddenSSID}');
    print('Wi-Fi Enabled: ${androidData.isWifiEnabled}');
    print('5GHz Band Supported: ${androidData.is5GHzBandSupported}');
    print('Connection Type: ${androidData.connectionType}');
    print('Is Connected: ${androidData.isConnected}');
  }

  /// A function to get Linux information
  ///
  /// This function returns an instance of the [Linux] class containing
  /// information about the Linux system.
  Future getLinuxInfo() async {
    var linuxData = await Zap.deviceInfo.linux;

    // Print Linux information
    print('Linux Information:');
    print('OS: ${linuxData.osInfo?.os}');
    print('Distribution: ${linuxData.osInfo?.distribution}');
    print('Version: ${linuxData.osInfo?.version}');
    print('Kernel: ${linuxData.osInfo?.kernel}');
    print('Architecture: ${linuxData.osInfo?.architecture}');
    print('Additional Info: ${linuxData.osInfo?.additionalInfo}');

    print('\nCPU Information:');
    print('Processor: ${linuxData.cpuInfo?.processor}');
    print('Vendor ID: ${linuxData.cpuInfo?.vendorId}');
    print('CPU Family: ${linuxData.cpuInfo?.cpuFamily}');
    print('Model: ${linuxData.cpuInfo?.model}');
    print('Model Name: ${linuxData.cpuInfo?.modelName}');
    print('Stepping: ${linuxData.cpuInfo?.stepping}');
    print('Microcode: ${linuxData.cpuInfo?.microcode}');
    print('CPU MHz: ${linuxData.cpuInfo?.cpuMHz}');
    print('Cache Size: ${linuxData.cpuInfo?.cacheSize}');
    print('Physical ID: ${linuxData.cpuInfo?.physicalId}');
    print('Siblings: ${linuxData.cpuInfo?.siblings}');
    print('Core ID: ${linuxData.cpuInfo?.coreId}');
    print('CPU Cores: ${linuxData.cpuInfo?.cpuCores}');
    print('APIC ID: ${linuxData.cpuInfo?.apicid}');
    print('Initial APIC ID: ${linuxData.cpuInfo?.initialApicid}');
    print('FPU: ${linuxData.cpuInfo?.fpu}');
    print('FPU Exception: ${linuxData.cpuInfo?.fpuException}');
    print('CPUID Level: ${linuxData.cpuInfo?.cpuidLevel}');
    print('WP: ${linuxData.cpuInfo?.wp}');
    print('Flags: ${linuxData.cpuInfo?.flags}');
    print('Bugs: ${linuxData.cpuInfo?.bugs}');
    print('Bogomips: ${linuxData.cpuInfo?.bogomips}');
    print('TLB Size: ${linuxData.cpuInfo?.tlbSize}');
    print('CLFLUSH Size: ${linuxData.cpuInfo?.clflushSize}');
    print('Cache Alignment: ${linuxData.cpuInfo?.cacheAlignment}');
    print('Address Sizes: ${linuxData.cpuInfo?.addressSizes}');
    print('Power Management: ${linuxData.cpuInfo?.powerManagement}');

    print('\nMemory Information:');
    print('Total: ${linuxData.memoryInfo?.total}');
    print('Used: ${linuxData.memoryInfo?.used}');
    print('Free: ${linuxData.memoryInfo?.free}');
    print('Shared: ${linuxData.memoryInfo?.shared}');
    print('Buffer/Cache: ${linuxData.memoryInfo?.buffCache}');
    print('Available: ${linuxData.memoryInfo?.available}');

    print('\nSwap Information:');
    print('Total: ${linuxData.swapInfo?.total}');
    print('Used: ${linuxData.swapInfo?.used}');
    print('Free: ${linuxData.swapInfo?.free}');
  }

  /// A function to get information specific to a web environment (browser).
  ///
  /// This function creates an instance of the [ZapWebInfo] class and retrieves
  /// various web-related information such as location, platform, device memory,
  /// user agent, etc.
  Future getWebInfo() async {
    // Create an instance of ZapWebInfo
    var webData = ZapWebInfo();

    // Retrieve web information
    var location = await webData.location;
    var platform = webData.platform;
    var cookieEnabled = webData.cookieEnabled;
    var deviceMemory = webData.deviceMemory;
    var userAgent = webData.userAgent;
    var appVersion = webData.appVersion;
    var language = webData.language;
    var languages = webData.languages;
    var innerWidth = webData.innerWidth;
    var innerHeight = webData.innerHeight;

    // Display alert
    webData.showAlert('Hello, this is an alert from ZapWebInfo!');

    // Push a notification
    webData.pushNotification('Notification Title', 'Notification Body');
    // Print retrieved information
    print('Location: $location');
    print('Platform: $platform');
    print('Cookie Enabled: $cookieEnabled');
    print('Device Memory: $deviceMemory GB');
    print('User Agent: $userAgent');
    print('App Version: $appVersion');
    print('Language: $language');
    print('Languages: $languages');
    print('Inner Width: $innerWidth');
    print('Inner Height: $innerHeight');

    // Retrieve location information
    Location getLocation = await webData.location;

    // Print location information
    print('Location Information:');
    print('Accuracy: ${location.accuracy}');
    print('Altitude: ${location.altitude}');
    print('Altitude Accuracy: ${location.altitudeAccuracy}');
    print('Heading: ${location.heading}');
    print('Latitude: ${location.latitude}');
    print('Longitude: ${location.longitude}');
    print('Speed: ${location.speed}');
  }

  /// Saves data using the [ZapStore] class methods.
  Future<void> saveData() async {
    // Insert a new key-value pair.
    await zapStore.add("key", "new value");

    // Retrieve the value associated with the key.
    Future<String?>? StringRetrievedValue = zapStore.getString("key");
   Future<bool?>?  BoolRetrievedValue = zapStore.getBool("key");
   Future<int?>?  IntRetrievedValue = zapStore.getInt("key");
    Future<Map?>? MapRetrievedValue = zapStore.getMap("key");
    Future<List<String>?>? getStringListRetrievedValue = zapStore.getStringList("key");
Future<double?>? getDoubleValue = zapStore.getDouble("key");
    // Delete the key-value pair.
    bool deleted = await zapStore.delete("key");

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
