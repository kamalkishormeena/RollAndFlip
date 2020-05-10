import 'dart:io';

import 'package:flutter/material.dart';
import 'DiceActivity.dart';
import 'CoinActivity.dart';
import 'AboutActivity.dart';

class MainActivity extends StatefulWidget {
  MainActivity({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MainActivityState createState() => _MainActivityState();
}

class _MainActivityState extends State<MainActivity> {
  void _navigateToDice(BuildContext context) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => DiceActivity()));
  }

  void _navigateToCoin(BuildContext context) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => CoinActivity()));
  }

  void _navigateToAbout(BuildContext context) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => AboutActivity()));
  }

  Future<bool> _onWillPop() {
    return showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text('Are you sure?'),
            content: Text('Do you want to exit an App'),
            actions: <Widget>[
              FlatButton(
                onPressed: () => Navigator.of(context).pop(false),
                child: Text('No'),
              ),
              FlatButton(
                onPressed: () => exit(0),
                /*Navigator.of(context).pop(true)*/
                child: Text('Yes'),
              ),
            ],
          ),
        ) ??
        false;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        appBar: AppBar(
          brightness: Brightness.light,
          backgroundColor: Colors.white,
          elevation: 5,
          title: Text(
            'Roll and Flip',
//          widget.title,
            style: TextStyle(color: Colors.black, letterSpacing: 1.0),
          ),
          centerTitle: true,
          actionsIconTheme:
              IconThemeData(color: Colors.black, opacity: 10.0, size: 30.0),
          actions: <Widget>[
            Padding(
              padding: EdgeInsets.only(right: 20.0),
              child: GestureDetector(
                onLongPress: () {
                  Tooltip(message: "About this app", child: new Text("About"));
                },
                onTap: () {
                  _navigateToAbout(context);
                },
                child: Icon(
                  Icons.info_outline,
                  size: 26.0,
                ),
              ),
            ),
          ],
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                width: 300,
                height: 300,
                child: Image(
                  image: AssetImage('images/icon.png'),
                ),
              ),
              Column(
                children: <Widget>[
                  SizedBox(
                    width: double.infinity,
                    child: Padding(
                      padding: const EdgeInsets.only(
                          top: 8.0, bottom: 8.0, right: 70.0, left: 70.0),
                      child: RaisedButton(
                        color: Colors.deepOrange,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        padding: EdgeInsets.fromLTRB(30, 15, 30, 15),
                        child: Text(
                          'Roll A Dice',
                          style: TextStyle(
                              fontSize: 20.0,
                              color: Colors.white,
                              letterSpacing: 2.0),
                        ),
                        onPressed: () {
                          _navigateToDice(context);
                        },
                      ),
                    ),
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: Padding(
                      padding: const EdgeInsets.only(
                          top: 8.0, bottom: 8.0, right: 70.0, left: 70.0),
                      child: FlatButton(
                        color: Colors.deepOrangeAccent,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        padding: EdgeInsets.fromLTRB(30, 15, 30, 15),
                        child: Text(
                          'Toss A Coin',
                          style: TextStyle(
                              fontSize: 20.0,
                              color: Colors.white,
                              letterSpacing: 2.0),
                        ),
                        onPressed: () => {
                          _navigateToCoin(context),
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
