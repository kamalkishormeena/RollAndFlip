import 'package:flutter/material.dart';

class AboutActivity extends StatefulWidget {
  AboutActivity({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _AboutActivityState createState() => _AboutActivityState();
}

class _AboutActivityState extends State<AboutActivity> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        brightness: Brightness.light,
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          'Dice',
          style: TextStyle(color: Colors.black, letterSpacing: 1.0),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              width: 300,
              height: 300,
              child: Text(
                "This app is just for entertainment purpose only.",
                style: TextStyle(fontSize: 20.0),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
