import 'package:flutter/material.dart';
import 'package:mattermost/splash_screen.dart';
import 'package:mattermost/ui/select_server/select_server.dart';

void main() {
  runApp(new MaterialApp(
    home: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SplashScreen(
      navigateTo: new SelectServer(),
    );
  }
}
