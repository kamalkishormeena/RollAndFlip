import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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
        automaticallyImplyLeading: false,
        iconTheme: IconThemeData(color: Colors.black),
        brightness: Brightness.light,
        backgroundColor: Colors.white,
        elevation: 0,
        actionsIconTheme:
            IconThemeData(color: Colors.black, opacity: 10.0, size: 30.0),
        actions: <Widget>[
          Padding(
            padding: EdgeInsets.only(right: 20.0),
            child: GestureDetector(
              onLongPress: () {
                Tooltip(message: "Close", child: new Text("Close"));
              },
              onTap: () {
                if (Navigator.canPop(context)) {
                  Navigator.pop(context);
                } else {
                  SystemNavigator.pop();
                }
              },
              child: Icon(
                Icons.close,
                size: 26.0,
              ),
            ),
          ),
        ],
        title: Text(
          'About',
          style: TextStyle(color: Colors.black, letterSpacing: 1.0),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Container(
              margin: EdgeInsets.all(25),
              decoration: new BoxDecoration(
                color: Colors.deepOrange,
                shape: BoxShape.rectangle,
                borderRadius: new BorderRadius.circular(8.0),
                boxShadow: <BoxShadow>[
                  new BoxShadow(
                    color: new Color.fromARGB(80, 255, 89, 0),
                    blurRadius: 20.0,
                    offset: new Offset(0.0, 10.0),
                  ),
                ],
              ),
              child: Padding(
                padding: EdgeInsets.all(15),
                child: Text(
                  "This app is just for entertainment purpose only.\n"
                  "This app is useful whenever you want to roll a dice and toss a coin",
                  style: TextStyle(fontSize: 20.0, color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
