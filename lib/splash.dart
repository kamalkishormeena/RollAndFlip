import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'MainActivity.dart';

class SplashActivity extends StatefulWidget {
  @override
  _SplashActivityState createState() => _SplashActivityState();
}

class _SplashActivityState extends State<SplashActivity> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 5), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => MainActivity(),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              width: 300,
              height: 300,
              child: Image.asset('images/icon.png'),
            ),
            Text(
              'Roll And Flip',
              style: TextStyle(
                  fontSize: 38,
                  color: Colors.black,
                  letterSpacing: 1,
                  fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
