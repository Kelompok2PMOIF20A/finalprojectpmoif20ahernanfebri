import 'dart:js';

import 'package:finalprojectpmo/screens/splashscreen_view.dart';
import 'package:flutter/material.dart';
import 'package:finalprojectpmo/screens/login_view.dart';
import 'package:finalprojectpmo/screens/register_view.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'Splash Screen',
    initialRoute: "/",
    routes: {
      "/" : (context) => SplashScreenPage(),
      LoginPage.routeName : (context) => LoginPage(),
      RegisterPage.routeName : (context) => RegisterPage(),
    },
  ));
}
