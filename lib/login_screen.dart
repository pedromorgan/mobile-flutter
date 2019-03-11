import 'package:flutter/material.dart';
import 'package:mattermost/assets.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login Chooser'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Image.asset(ImageAssets.logoImage),
            ),
            Text(
              'Mattermost',
              style: const TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
              child: Center(
                child: Text(
                  'All team communication in one place, searchable and accessible anywhere',
                  style: const TextStyle(fontSize: 12.0),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
              child: Text(
                'Choose your login method',
                style: const TextStyle(fontSize: 12.0, fontWeight: FontWeight.bold),
              ),
            ),
            LoginButton(
              text: 'Email and Password',
            ),
            LoginButton(
              text: 'Mattermost Corp Username',
              textColor: Colors.white,
              backGroundColor: Colors.blueAccent,
              borderColor: Colors.blueAccent,
              splashColor: Colors.white,
            ),
            LoginButton(
              text: 'With OneLogin',
              textColor: Colors.white,
              backGroundColor: Colors.green,
              borderColor: Colors.green,
              splashColor: Colors.white,
            ),
          ],
        ),
      ),
    );
  }
}

class LoginButton extends StatelessWidget {
  
  LoginButton({
    this.backGroundColor = Colors.white,
    this.text,
    this.textColor = Colors.blue,
    this.borderColor = Colors.blue,
    this.splashColor = Colors.blue,
  });

  final Color backGroundColor;
  final Color textColor;
  final Color borderColor;
  final Color splashColor;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 16.0),
      child: Container(
        color: backGroundColor,
        child: SizedBox(
          width: double.infinity,
          height: 50.0,
          child: ButtonTheme(
            buttonColor: Colors.redAccent,
            child: OutlineButton(
              child: Text(text),
              splashColor: splashColor,
              textColor: textColor,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(2.0)),
              borderSide: BorderSide(color: borderColor),
              onPressed: () {},
            ),
          ),
        ),
      ),
    );
  }
}
