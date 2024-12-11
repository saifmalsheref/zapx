# Zapx Flutter Package

The Zapx package is a powerful collection of extensions and utilities for Flutter applications. It simplifies navigation, enhances validation, enables localization, and provides convenient tools for developers to create robust applications efficiently.

---

## Table of Contents

1. [Getting Started](#getting-started)
2. [Features](#features)
3. [XMaterialApp](#xmaterialapp)
4. [ZapX Extension](#zapx-extension)
5. [Validation](#validation)
6. [Translation](#translation)
7. [Navigation](#navigation)
8. [Updates and Improvements](#updates-and-improvements)
9. [Examples](#examples)

---

## Getting Started

To start using the Zapx package in your Flutter project, add the dependency to your `pubspec.yaml` file:

```yaml
dependencies:
  zapx: latest
```

Then, run:

```bash
flutter pub get
```

Import the package into your Dart files as needed:

```dart
import 'package:zapx/zapx.dart';
```

---

## Features

- **Enhanced Navigation**: Simplifies navigation between pages with custom transitions and intuitive methods.
- **Validation Tools**: Provides ready-to-use methods for common validation needs like email, passwords, phone numbers, and URLs.
- **Localization**: Adds easy translation management for multi-language support.
- **Utility Extensions**: Includes shortcuts for padding, margin, and opacity for widgets.
- **Custom Material App**: Extends MaterialApp to include additional configurations .

---

## XMaterialApp

### Overview

The `XMaterialApp` extends the default `MaterialApp` to provide additional features and seamless integration with Zapx tools. It supports configurations localization keys.

### Example

```dart
void main() {
  runApp(
    XMaterialApp(
      home: MyHomePage(),
    ),
  );
}
```



## ZapX Extension

### Overview

Provides utility properties and methods for accessing device information, app settings, and convenient widget styling shortcuts.

### Widget Shortcuts

- **withOpacity**: Adjust widget opacity.
- **paddingAll**: Add equal padding to all sides.
- **paddingSymmetric**: Add symmetric padding for horizontal and vertical.
- **marginAll**: Add equal margins to all sides.
- **marginSymmetric**: Add symmetric margins for horizontal and vertical.

### Example

```dart
Scaffold(
  appBar: AppBar(
    title: Text('ZapX Example'),
  ),
  body: Center(
    child: Text('Hello World!')
        .withOpacity(0.7)
        .paddingAll(16)
        .marginAll(8),
  ),
);
```

---

## Validation

### Overview

The `ZapValidation` extension provides common validation methods for email, passwords, phone numbers, and URLs.

### Methods

- **isValidEmail**: Validates email format.
- **isValidPassword**: Validates password strength.
- **isValidPhoneNumber**: Validates phone numbers.
- **isValidUrl**: Validates URLs.

### Example

```dart
String email = 'test@example.com';
print('Is Valid Email: ${Zap.isValidEmail(email)}');
```

---

## Translation

### Overview

Provides translation capabilities for multi-language support using the `ztr` method. Translations are managed through a map of keys and values for each locale.

### Example

```dart
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return XMaterialApp(
      translationsKeys: {
        "en": {"hello": "Hello"},
        "ar": {"hello": "مرحبا"},
      },
      locale: Locale("en"),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("hello".ztr),
      ),
    );
  }
}
```

---

## Navigation

### Overview

Simplifies navigation with intuitive methods and custom transitions:

- **to**: Navigate to a new page.
- **toNamed**: Navigate using a named route.
- **back**: Return to the previous page.
- **off**: Replace the current page.
- **offAll**: Clear the navigation stack and navigate to a new page.

### Example

```dart
Zap.to(MyHomePage(), transition: Transition.zoom);
Zap.toNamed('/details', arguments: {'id': 123});
Zap.back();
Zap.off(MyHomePage());
Zap.offAll(MyHomePage());
```

---

## Updates and Improvements

- **Enhanced Validation**: Added support for password strength criteria.
- **Advanced Localization**: Dynamic locale changes and fallback mechanisms.
- **New Navigation Transitions**: Added slide, zoom, and fade transitions.

---

## Examples

For a detailed implementation guide and more examples, visit the official documentation or refer to the example folder in the GitHub repository.

---

Start leveraging the Zapx package today to enhance your Flutter development experience with powerful tools and seamless integrations!

