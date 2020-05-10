import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'splash.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.black12,
    ));
    return MaterialApp(
      title: 'Roll & Flip App',
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
        scaffoldBackgroundColor: Colors.white,
      ),
      home: SplashActivity(),
//      home: MainActivity(title: 'Roll and Flip'),
    );
  }
}
