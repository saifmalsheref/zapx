# Zap Flutter Package

The Zap package is a collection of extensions and utilities for Flutter applications, offering enhanced functionality in areas such as navigation, validation, localization, and local storage using SQLite.

## Table of Contents

1. [XMaterialApp](#xmaterialapp)
1. [ZapX Extension](#zapx-extension)
2. [ZapValidator Extension](#zapvalidator-extension)
3. [TranslationExtension Extension](#translationextension-extension)
4. [ZapStore Class](#zapstore-class)
5. [ZapNavigation Extension](#zapnavigation-extension)

---

## XMaterialApp
### Overview

The XMaterialApp is an extension of MaterialApp that integrates seamlessly with the Zap package. It enhances the overall functionality of MaterialApp and provides additional features for a smoother development experience.

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

---

## ZapValidator Extension

### Overview

The `ZapValidator` extension offers common validation methods for `ZapInterface`. It includes validation for email addresses, passwords, phone numbers, and URLs.

### Validation Methods

- **isValidEmail**: Validates if the given value is a valid email address.
- **isValidPassword**: Validates if the given value is a valid password with optional criteria.
- **isValidPhoneNumber**: Validates if the given value is a valid 10-digit phone number.
- **isValidUrl**: Validates if the given value is a valid URL with specified valid schemes.

---

## TranslationExtension Extension

### Overview

The `TranslationExtension` extension provides translation capabilities for strings. It enables the translation of strings using the app's current locale.

### Translation Method

- **ztr**: Translates the string using the app's current locale. If a translation is found, it returns the translated string; otherwise, it returns the original string.

---

## ZapStore Class

### Overview

The `ZapStore` class is a simple local storage solution using SQLite in Flutter. It facilitates basic CRUD operations (Create, Read, Update, Delete) on a SQLite database.

### Methods

- **insert**: Inserts a key-value pair into the database.
- **get**: Retrieves the value associated with a given key from the database.
- **delete**: Deletes a key-value pair from the database based on the key.
- **update**: Updates the value associated with a given key in the database.

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

---

Feel free to explore and leverage the features provided by the Zap package to enhance your Flutter applications. For detailed information on each extension and class, refer to the respective sections above.
