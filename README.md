# Zapx Flutter Package

The Zapx package is a versatile collection of extensions and utilities for Flutter applications, designed to enhance functionality in various domains, including navigation, validation, localization, and local storage using Json. With the Zapx package, developers can seamlessly access device-specific information for Android, Linux, and web environments.

## Table of Contents

1. [XMaterialApp](#xmaterialapp)
1. [Android Info](#android-info)
1. [Linux Info](#linux-info)
1. [Web Info](#web-info)
1. [ZapX Extension](#zapx-extension)
2. [Validator Extension](#validator-extension)
3. [Translation Extension](#translation-extension)
4. [ZapStore](#zapstore)
5. [Navigation Extension](#navigation-extension)

---

## XMaterialApp
### Overview

The XMaterialApp is an extension of MaterialApp that integrates seamlessly with the Zapx package. It enhances the overall functionality of MaterialApp and provides additional features for a smoother development experience.

### Example
```dart
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return XMaterialApp(
      home: MyHomePage(),
    );
  }
}

```


## Android Info
### Overview

The `Android Info` represents device information and provides methods to retrieve details about the device and network information and provides methods to retrieve details about the network asynchronously.

### Properties

- **model**: The model of the device.
- **brand**: The brand of the device.
- **manufacturer**: The manufacturer of the device.
- **product**: The product name of the device.
- **hardware**: The hardware specification of the device.
- **serial**: The serial number of the device.
- **androidVersion**: The Android version of the device.
- **versionCodeName**: The code name of the Android version.
- **versionIncremental**: The incremental version of the Android build.
- **versionSdk**: The SDK version of the Android build.
- **deviceTemperature**: The device temperature in degrees Celsius.
 - **wifiSSID**: The SSID (Service Set Identifier) of the connected Wi-Fi network.
 - **wifiBSSID**: The BSSID (Basic Service Set Identifier) of the connected Wi-Fi network.
 - **ipAddress**: The IP address of the device on the network.
 - **macAddress**: The MAC (Media Access Control) address of the Wi-Fi interface.
- **linkSpeed**: The link speed of the Wi-Fi connection in Mbps.
 - **networkId**: The ID of the connected Wi-Fi network.
 - **hiddenSSID**: Indicates whether the SSID of the Wi-Fi network is hidden.
 - **isWifiEnabled**: Indicates whether Wi-Fi is enabled on the device.
 - **is5GHzBandSupported**: Indicates whether the 5GHz band is supported on the device.
 - **connectionType**: The type of network connection the device is currently using.
- **isConnected**: Indicates whether the device is currently connected to a network.



### Example

```dart
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

```

## Linux Info

A Dart class providing information about a Linux system.

### Properties In Classes

 _MemoryInfo_

Represents information about the system's memory.

Properties:

- `total`: Type `int` - Total amount of memory.
- `used`: Type `int` - Used memory.
- `free`: Type `int` - Free memory.
- `shared`: Type `int` - Shared memory.
- `buffCache`: Type `int` - Memory used for buffers/cache.
- `available`: Type `int` - Available memory.

 _SwapInfo_

Represents information about the system's swap.

Properties:

- `total`: Type `int` - Total swap space.
- `used`: Type `int` - Used swap space.
- `free`: Type `int` - Free swap space.

 _CpuInfo_

Represents information about the system's CPU.

Properties:

- `processor`: Type `int` - Processor number.
- `vendorId`: Type `String` - Vendor ID.
- `cpuFamily`: Type `int` - CPU family.
- `model`: Type `int` - CPU model.
- `modelName`: Type `String` - Model name.
- `stepping`: Type `int` - CPU stepping.
- `microcode`: Type `String` - CPU microcode.
- `cpuMHz`: Type `double` - CPU frequency in MHz.
- `cacheSize`: Type `String` - CPU cache size.
- `physicalId`: Type `int` - Physical CPU ID.
- `siblings`: Type `int` - Number of siblings.
- `coreId`: Type `int` - Core ID.
- `cpuCores`: Type `int` - Number of CPU cores.
- `apicid`: Type `int` - APIC ID.
- `initialApicid`: Type `int` - Initial APIC ID.
- `fpu`: Type `String` - FPU presence.
- `fpuException`: Type `String` - FPU exception.
- `cpuidLevel`: Type `int` - CPUID level.
- `wp`: Type `String` - Write-protect support.
- `flags`: Type `String` - CPU flags.
- `bugs`: Type `String` - CPU bugs.
- `bogomips`: Type `double` - Bogomips value.
- `tlbSize`: Type `int` - TLB size.
- `clflushSize`: Type `int` - CLFLUSH cache line size.
- `cacheAlignment`: Type `int` - Cache alignment.
- `addressSizes`: Type `String` - Address sizes.
- `powerManagement`: Type `String` - Power management features.

 _OsInfo_

Represents information about the operating system.

Properties:

- `os`: Type `String` - Operating system name.
- `distribution`: Type `String` - Linux distribution name.
- `version`: Type `String` - Operating system version.
- `kernel`: Type `String` - Linux kernel version.
- `architecture`: Type `String` - System architecture.
- `additionalInfo`: Type `String` - Additional information.

### Example

```dart
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
```
---

## Web Info

A Dart class providing information specific to a web environment (browser).

### Properties

### `location`

- Type: [Location](#location)
- Description: Represents information about the current location.

### `platform`

- Type: `String`
- Description: Gets the platform of the browser.

### `cookieEnabled`

- Type: `bool`
- Description: Gets whether cookies are enabled in the browser.

### `deviceMemory`

- Type: `num`
- Description: Gets the amount of device memory in gigabytes.

### `userAgent`

- Type: `String`
- Description: Gets the user agent string.

### `appVersion`

- Type: `String`
- Description: Gets the application version.

### `language`

- Type: `String`
- Description: Gets the language of the browser.

### `languages`

- Type: `List<String>`
- Description: Gets a list of preferred languages set in the browser.

### `innerWidth`

- Type: `int`
- Description: Gets the inner width of the browser window.

### `innerHeight`

- Type: `int`
- Description: Gets the inner height of the browser window.

### Methods

### `showAlert`

- Parameters:
  - `message` (Type: `String`): The message to display in the alert.

- Description: Displays an alert with the specified message.

### `pushNotification`

- Parameters:
  - `title` (Type: `String`): The title of the notification.
  - `body` (Type: `String`): The body of the notification.

- Description: Pushes a browser notification with the given title and body. Requires the user's permission to show notifications.

### Classes

### Location

Represents information about the current location.

Properties:

- `accuracy` (Type: `num?`): The accuracy of the location in meters.
- `altitude` (Type: `num?`): The altitude of the location in meters.
- `altitudeAccuracy` (Type: `num?`): The accuracy of the altitude in meters.
- `heading` (Type: `num?`): The direction in which the device is traveling in degrees.
- `latitude` (Type: `num?`): The latitude of the location.
- `longitude` (Type: `num?`): The longitude of the location.
- `speed` (Type: `num?`): The speed at which the device is traveling in meters per second.


### Example
```dart
import 'package:zapx/Zap/extensions/device_data/platforms/web.dart';

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

```
---


## ZapX Extension

### Overview

The `ZapX` extension provides utility properties for the `ZapInterface`. It includes methods to access navigator state, retrieve device information, and obtain app-related details.

### Properties and Methods

- **navigatorKey**: A key for accessing the navigator state.
- **context**: Returns the current BuildContext using the navigator key.
- **isDarkMode**: Indicates whether the app is currently in dark mode.
- **height**: Returns the height of the device screen.
- **width**: Returns the width of the device screen.
- **statusBarHeight**: Returns the height of the device's status bar.
- **bottomBarHeight**: Returns the height of the device's bottom navigation bar.
- **topBarHeight**: Returns the height of the device's top app bar.
- **safeAreaHeight**: Returns the height of the device's safe area.
- **safeAreaWidth**: Returns the width of the device's safe area.
- **locale**: Returns the current locale of the app.
- **systemLocale**: Returns the system locale of the device.
- **deviceOrientation**: Returns the orientation of the device.
- **platform**: Returns the current platform of the device.
- **pixelDensity**: Returns the device pixel density.
- **textScaleFactor**: Returns the text scale factor of the device.
- **systemInsets**: Returns the system insets of the device.
- **currentTheme**: Returns the current ThemeData of the app.
- **platformVersion**: Returns the version of the operating system on the device.
- **isAccessibilityEnabled**: Returns whether the device has accessibility features enabled.

### Example

```dart
void main(){
      print('Navigator Key: ${Zap.navigatorKey}');
  print('Context: ${Zap.context}');
  print('Is Dark Mode: ${Zap.isDarkMode}');
  print('Height: ${Zap.height}');
  print('Width: ${Zap.width}');
  print('Status Bar Height: ${Zap.statusBarHeight}');
  print('Bottom Bar Height: ${Zap.bottomBarHeight}');
  print('Top Bar Height: ${Zap.topBarHeight}');
  print('Safe Area Height: ${Zap.safeAreaHeight}');
  print('Safe Area Width: ${Zap.safeAreaWidth}');
  print('Locale: ${Zap.locale}');
  print('System Locale: ${Zap.systemLocale}');
  print('Device Orientation: ${Zap.deviceOrientation}');
  print('Platform: ${Zap.platform}');
  print('Pixel Density: ${Zap.pixelDensity}');
  print('Text Scale Factor: ${Zap.textScaleFactor}');
  print('System Insets: ${Zap.systemInsets}');
  print('Current Theme: ${Zap.currentTheme}');
  print('Platform Version: ${Zap.platformVersion}');
  print('Is Accessibility Enabled: ${Zap.isAccessibilityEnabled}');
}

```

---

## Validator Extension

### Overview

The `ZapValidator` extension offers common validation methods for `ZapInterface`. It includes validation for email addresses, passwords, phone numbers, and URLs.

### Validation Methods

- **isValidEmail**: Validates if the given value is a valid email address.
- **isValidPassword**: Validates if the given value is a valid password with optional criteria.
- **isValidPhoneNumber**: Validates if the given value is a valid 10-digit phone number.
- **isValidUrl**: Validates if the given value is a valid URL with specified valid schemes.

### Example

```dart
void main(){
  // Example values for validation
  String email = 'test@example.com';
  String password = 'SecurePassword123';
  String phoneNumber = '1234567890';
  String url = 'https://www.example.com';

  // Validate email
  print('Is Valid Email: ${Zap.isValidEmail(email)}');

  // Validate password
  print('Is Valid Password: ${Zap.isValidPassword(password)}');

  // Validate phone number
  print('Is Valid Phone Number: ${Zap.isValidPhoneNumber(phoneNumber)}');

  // Validate URL
  print('Is Valid URL: ${Zap.isValidUrl(url)}');
}

```

---

## Translation Extension

### Overview

The `Translation` extension provides translation capabilities for strings. It enables the translation of strings using the app's current locale.

### Translation Method

- **ztr**: Translates the string using the app's current locale. If a translation is found, it returns the translated string; otherwise, it returns the original string.

### Example
```dart
Locale myLocale = Locale("ar");
// in myApp
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
   ///[XMaterialApp] is assumed to be part of MaterialApp based on the provided information
    return XMaterialApp(
      translationsKeys: TranslationController.Translation,
      locale: myLocale,
      home: MyHomePage(),
    );
  }
}

///[TranslationController]
class TranslationController {
  static Map<String, Map<String, String>> Translation = {
    "ar":{
      "hello": "مرحبا",
    },
    "en":{
      "hello": "Hello"
    }
  };
}


///[homeScreen] 
class homeScreen extends StatelessWidget {
  const homeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('hello'.ztr), // مرحبا
      ),
      body: TextButton(
        onPressed: (){
          myLocale = Locale("en"); // change locale to English
          setState(() {}); // update the UI or using your state Managment update
        },
        child: Text("change locale")
      )
    );}}


```

---

## ZapStore

### Overview

The `ZapStore` class is a simple local storage solution using Json in Flutter. It facilitates basic CRUD operations (Create or Update, Read, Delete) on a Json database.

### Methods

- **add**: Inserts a key-value pair into the database.
  - Parameters:
    - `key`: The key to insert.
    - `value`: The value associated with the key.

- **get**: Retrieves the value associated with a given key from the database.
  - Parameters:
    - `key`: The key to retrieve the value for.
  - Returns: The value associated with the specified key.

- **delete**: Deletes a key-value pair from the database based on the key.
  - Parameters:
    - `key`: The key to delete.
  - Returns: A `Future<bool>` indicating whether the deletion was successful.

### Example

```dart
import 'package:zapx/Zap/extensions/zap_store.dart';

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

```
---


## Navigation Extension

### Overview

The `ZapNavigation` extension provides convenient navigation methods using the Flutter Navigator. It includes methods for navigating to pages, pushing and replacing routes, popping routes, and managing route transitions.

### Navigation Methods

- **to**: Navigate to a new page with various configurable options.
- **toNamed**: Navigate to a named route with optional arguments.
- **back**: Pop the current route from the Navigator stack.
- **off**: Replace the current page with a new one.
- **offAll**: Replace the entire Navigator stack with a new page.
- **offNamed**: Replace the current named route with a new one.
- **offAllNamed**: Replace the entire Navigator stack with a new named route.

### Example
```dart
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

```
---

Feel free to explore and leverage the features provided by the Zapx package to enhance your Flutter applications. For detailed information on each extension and class, refer to the respective sections above.
