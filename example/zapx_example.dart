import 'package:flutter/material.dart';
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
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ZapX Example'),
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
            Text("device current Orientation state ${Zap.deviceOrientation}"),
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
   bool urlValid=  Zap.isValidUrl(text,validSchemes: ["http","https"]);
  }
}
