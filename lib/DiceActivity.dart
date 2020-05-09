import 'dart:math';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/material.dart';

class DiceActivity extends StatefulWidget {
  DiceActivity({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _DiceActivityState createState() => _DiceActivityState();
}

class _DiceActivityState extends State<DiceActivity>
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

  int diceNumber = 1;

  void diceSate() {
    startRotation();
    Future.delayed(const Duration(milliseconds: 800), () {
      setState(() {
        if (animationController.isAnimating) {
          diceNumber = Random().nextInt(6) + 1;
          print('dice number $diceNumber');
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
              child: Padding(
                padding: const EdgeInsets.all(80.0),
                child: AnimatedBuilder(
                  animation: animationController,
                  child: Image(
                    image: AssetImage('images/dice/d$diceNumber.png'),
                  ),
                  builder: (BuildContext context, Widget _widget) {
                    return Transform.rotate(
                      angle: animationController.value * 3.13,
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
                  'Click to Roll Dice',
                  style: TextStyle(
                      fontSize: 20.0, color: Colors.white, letterSpacing: 2.0),
                ),
                onPressed: () {
                  diceSate();
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
