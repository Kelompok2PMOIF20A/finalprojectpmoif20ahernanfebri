import 'dart:js';

import 'package:finalprojectpmo/screens/login.dart';
import 'package:finalprojectpmo/screens/splashscreen_view.dart';
import 'package:flutter/material.dart';
import 'package:finalprojectpmo/screens/login.dart';
import 'package:finalprojectpmo/screens/register.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'Splash Screen',
    initialRoute: "/",
    routes: {
      "/" : (context) => SplashScreenPage(),
    },
  ));
}
