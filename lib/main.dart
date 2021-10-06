import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'ProfilePage.dart';
import 'SavingPage.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
  ));
  runApp(
    MyApp(),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: 'ProfilePage',
      routes: {
        'ProfilePage': (context) => ProfilePage(),
        'SavingPage': (context) => SavingPage(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}
