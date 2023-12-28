# Zap Flutter Package

The Zap package is a collection of extensions and utilities for Flutter applications, offering enhanced functionality in areas such as navigation, validation, localization, and local storage using SQLite.

## Table of Contents

1. [XMaterialApp](#xmaterialapp)
1. [DeviceInfo](#deviceinfo)
1. [NetworkInfo](#networkinfo)
1. [ZapX Extension](#zapx-extension)
2. [ZapValidator Extension](#zapvalidator-extension)
3. [TranslationExtension Extension](#translationextension-extension)
4. [ZapStore Class](#zapstore-class)
5. [ZapNavigation Extension](#zapnavigation-extension)

---

## XMaterialApp
### Overview

The XMaterialApp is an extension of MaterialApp that integrates seamlessly with the Zap package. It enhances the overall functionality of MaterialApp and provides additional features for a smoother development experience.


## DeviceInfo
### Overview

The `DeviceInfo` class represents device information and provides methods to retrieve details about the device asynchronously.

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
- **connectionType**: The type of network connection the device is currently using.
- **isConnected**: Indicates whether the device is currently connected to a network.

### Methods

- **Zap.deviceInfo**: Initializes and retrieves device information asynchronously.

### Example

```dart
Future<void> getMobileInfo() async {
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
```

## NetworkInfo

### Overview

The NetworkInfo class represents network information and provides methods to retrieve details about the network asynchronously.
### Properties

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

### Example

```dart
void main() async {
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

## ZapValidator Extension

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

## TranslationExtension Extension

### Overview

The `TranslationExtension` extension provides translation capabilities for strings. It enables the translation of strings using the app's current locale.

### Translation Method

- **ztr**: Translates the string using the app's current locale. If a translation is found, it returns the translated string; otherwise, it returns the original string.

### Example
```dart
// in myApp
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
   ///[XMaterialApp] is assumed to be part of MaterialApp based on the provided information
    return XMaterialApp(
      translationsKeys: TranslationController.Translation,
      locale: Locale("ar"),
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
    );}}


```

---

## ZapStore Class

### Overview

The `ZapStore` class is a simple local storage solution using SQLite in Flutter. It facilitates basic CRUD operations (Create, Read, Update, Delete) on a SQLite database.

### Methods

- **insert**: Inserts a key-value pair into the database.
- **get**: Retrieves the value associated with a given key from the database.
- **delete**: Deletes a key-value pair from the database based on the key.
- **update**: Updates the value associated with a given key in the database.

### Example

```dart
  /// Saves data using the [ZapStore] class methods.
Future<void> saveData() async {
    // Update the value associated with the key.
    await ZapStore.update(key, newValue);

    // Retrieve the value associated with the key.
    dynamic? retrievedValue = await ZapStore.get(key);

    // Delete the key-value pair.
    await ZapStore.delete(key);

    // Insert a new key-value pair.
    await ZapStore.insert(key, value);
  }

```
---


## ZapNavigation Extension

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

Feel free to explore and leverage the features provided by the Zap package to enhance your Flutter applications. For detailed information on each extension and class, refer to the respective sections above.
