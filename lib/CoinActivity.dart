import 'dart:math';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/material.dart';

class CoinActivity extends StatefulWidget {
  CoinActivity({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _CoinActivityState createState() => _CoinActivityState();
}

class _CoinActivityState extends State<CoinActivity>
    with SingleTickerProviderStateMixin {
  AnimationController animationController;

  @override
  void initState() {
    super.initState();

    animationController = new AnimationController(
      vsync: this,
      duration: new Duration(seconds: 1),
    );

//    animationController.forward();
  }

  stopRotation() {
    animationController.stop();
  }

  startRotation() {
    if (animationController.isCompleted)
      animationController.reverse();
    else
      animationController.forward();
  }

  int coinNumber = 1;

  void coinSate() {
    startRotation();
    Future.delayed(const Duration(milliseconds: 800), () {
      setState(() {
        if (animationController.isAnimating) {
          coinNumber = Random().nextInt(2) + 1;
          print('dice number $coinNumber');
        }
//      Fluttertoast.showToast(
//        msg: "You got $diceNumber",
//        toastLength: Toast.LENGTH_LONG,
//        gravity: ToastGravity.BOTTOM,
//        timeInSecForIosWeb: 1,
////        backgroundColor: Colors.red,
////        textColor: Colors.white,
////        fontSize: 16.0
//      );
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        brightness: Brightness.light,
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          'Coin',
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
              child: Padding(
                padding: const EdgeInsets.all(80.0),
                child: AnimatedBuilder(
                  animation: animationController,
                  child: Image(
                    image: AssetImage('images/coin/coin$coinNumber.png'),
                  ),
                  builder: (BuildContext context, Widget _widget) {
                    return Transform.rotate(
                      angle: animationController.value * 6.26,
                      child: _widget,
                    );
                  },
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: RaisedButton(
                color: Colors.deepOrange,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                padding: EdgeInsets.fromLTRB(30, 15, 30, 15),
                child: Text(
                  'Click to Toss a Coin',
                  style: TextStyle(
                      fontSize: 20.0, color: Colors.white, letterSpacing: 2.0),
                ),
                onPressed: () {
                  coinSate();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }
}
