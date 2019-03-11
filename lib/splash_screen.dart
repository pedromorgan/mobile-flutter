import 'dart:core';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:mattermost/assets.dart';

class SplashScreen extends StatefulWidget {
  final dynamic navigateTo;
  SplashScreen({this.navigateTo});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
        Duration(seconds: 2),
            () {
          if (widget.navigateTo is String) {
            // It's fairly safe to assume this is using the in-built material
            // named route component
            Navigator.of(context).pushReplacementNamed(widget.navigateTo);
          } else if (widget.navigateTo is Widget) {
            Navigator.of(context).pushReplacement(new MaterialPageRoute(builder: (BuildContext context) => widget.navigateTo));
          } else {
            throw new ArgumentError(
                'widget.navigateTo must either be a String or Widget'
            );
          }
        }
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: new InkWell(
        child:new Stack(
          fit: StackFit.expand,
          children: <Widget>[
            new Container(
              decoration: new BoxDecoration(
                color: Colors.white,
              ),
            ),
            new Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                new Expanded(
                  flex: 2,
                  child: new Container(
                      child: new Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          new CircleAvatar(
                            backgroundColor: Colors.transparent,
                            child: new Container(
                                child: Image.asset(ImageAssets.splashImage),
                            ),
                            radius: 200,
                          ),
                          new Padding(
                            padding: const EdgeInsets.only(top: 10.0),
                          ),
                        ],
                      )),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
