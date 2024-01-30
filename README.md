# Zapx Flutter Package

The Zapx package is a versatile collection of extensions and utilities for Flutter applications, designed to enhance functionality in various domains, including navigation, validation, localization.

## Table of Contents

1. [XMaterialApp](#xmaterialapp)
2. [Debug Banner](#debug-banner)
3. [ZapX Extension](#zapx-extension)
4. [Validaton](#Validaton)
5. [Translation](#translation)
6. [Navigation](#navigation)

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



## Debug Banner
### Overview
Displays a [Banner] saying "Zap Debug" when running in debug mode.
you can set message or remove by set 
debugShowCheckedModeBanner: false,
[XMaterialApp] builds this from as custom from MaterialApp.
Does nothing in release mode.

### Example
```dart
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return XMaterialApp(
      checkedBannerMessage: "Zap Debug",
      home: MyHomePage(),
    );
  }
}

```


## ZapX Extension

### Overview

The `ZapX` extension provides utility properties for the `ZapInterface` and `CustomExtension` widgets. It includes methods to access navigator state, retrieve device information, and obtain app-related details.

### Shortcut Extension
- **withOpacity**: Applies the specified [opacity] to the widget.
- **paddingAll**: Applies padding with the same [value] to all sides of the widget.
- **paddingSymmetric**: Applies symmetric padding with [horizontal] and [vertical] values to the widget.
- **paddingOnly**: Applies padding with different values for each side of the widget.
- **marginAll**: Applies margin with the same [value] to all sides of the widget.
- **marginSymmetric**: Applies symmetric margin with [horizontal] and [vertical] values to the widget.
- **marginOnly**: Applies margin with different values for each side of the widget.

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

- **Shortcut**
```dart
Scaffold(
        appBar: AppBar(
          title: Text('CustomExtension Example'),
        ),
        body: Center(
          child: Text('Hello World!')
              .withOpacity(0.7)
              .paddingAll(16)
              .marginAll(8),
        ),
      );

```

- **basics**
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

## Validaton 

### Overview

The `ZapValidaton` extension offers common validation methods for `ZapInterface`. It includes validation for email addresses, passwords, phone numbers, and URLs.

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

## Translation

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
<!-- 
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
--- -->


## Navigation

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
