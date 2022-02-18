import 'package:flutter/material.dart';
import 'package:shopapp_course/pages/home.dart';
import 'package:shopapp_course/pages/login.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      primaryColor: Colors.red[500]
    ),
    initialRoute: '/login',
    routes: {
      '/login': (context) => Login(),
      '/home': (context) => HomePage()
    }
  ));
}


