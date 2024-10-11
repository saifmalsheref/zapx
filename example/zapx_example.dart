// ignore_for_file: unused_local_variable, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:zapx/Zap/extensions/zap_translate.dart';
import 'package:zapx/zapx.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return XMaterialApp(
      // XMaterialApp is assumed to be part of MaterialApp based on the provided information
      translationsKeys: TranslationController.Translation,
      // Displays a [Banner] saying "Zap Debug" when running in debug mode.
      // you can set message or remove by set 
      //  debugShowCheckedModeBanner: false,
      // [XMaterialApp] builds one of these by default.
      // Does nothing in release mode.
      checkedBannerMessage: "Zap Debug",
      locale: const Locale("ar"),
      
      home: const MyHomePage(),
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
            const Text('Welcome to ZapX'),
            const SizedBox(height: 20),
            const Text('This is your home page.'),
            ElevatedButton(
                onPressed: () {
                  Zap.to(Container(), transition: Transition.leftToRight);
                },
                child: const Text("push page with Transition")),
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
        .showSnackBar(const SnackBar(content: Text("Zap context")));
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

  /// Example usage of the ZapNavigation functions.
  void ZapNavigationExample() {
    // Navigate to a new page (MyHomePage) with default transition
    Zap.to(const MyHomePage(),
        transition: Transition.native,
        allowSnapshotting: true,
        transitionDuration: const Duration(milliseconds: 300),
        reverseTransitionDuration: const Duration(milliseconds: 300),
        opaque: true);

    // Navigate to a named route ('/details') with arguments and default transition
    Zap.toNamed(
      '/details',
      arguments: {'id': 123},
    );

    // Pop the current route from the Navigator stack with default transition
    Zap.back();

    // Replace the current page with a new one (MyHomePage) with default transition
    Zap.off(const MyHomePage(),
        transition: Transition.native,
        allowSnapshotting: true,
        transitionDuration: const Duration(milliseconds: 300),
        reverseTransitionDuration: const Duration(milliseconds: 300),
        opaque: true);

    // Replace the entire Navigator stack with a new page (MyHomePage) with default transition
    Zap.offAll(const MyHomePage(),
        transition: Transition.native,
        allowSnapshotting: true,
        transitionDuration: const Duration(milliseconds: 300),
        reverseTransitionDuration: const Duration(milliseconds: 300),
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
