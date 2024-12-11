import 'package:flutter/material.dart';

import 'package:zapx/zapx.dart';
void main() {
  runApp(XMaterialApp(
    initialRoute: '/',
    onGenerateRoute: generateAppRoute,
  ));
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     appBar: AppBar(
        backgroundColor: Colors.green,
      ),  body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextButton(
            onPressed: () {
              Zap.toNamed( '/details');
            },
            child: Text('Go to Details Page'),
          ),
        ],
      ),
    );
  }
}

class DetailsPage extends StatelessWidget {
  const DetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
      ),
      body: Center(
        child: TextButton(
          onPressed: () {
           Zap.back();
          },
          child: Text('Back to Home Page'),
        ),
      ),
    );
  }
}



Route<dynamic>? generateAppRoute(RouteSettings settings) {
  switch (settings.name) {
    case '/':
      return Zap.animatedPageRoute(
        builder: (_)=> const HomePage(),
        transition: Transition.zoom
      );
    case '/details':
      return Zap.animatedPageRoute(
       builder: (_)=> const DetailsPage(),
        transition: Transition.zoom,
      );
  }
  return null;
}
