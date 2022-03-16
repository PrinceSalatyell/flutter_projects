import 'package:flutter/material.dart';
import 'package:quizz_app/screens/quizz_page.dart';
import 'package:quizz_app/screens/home_screen.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: HomePage(), debugShowCheckedModeBanner: false,);
  }
}
