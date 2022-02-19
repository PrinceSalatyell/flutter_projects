import 'dart:ui';

import 'package:flutter/material.dart';

import '../main.dart';

class ResultScreen extends StatefulWidget {
  final int score;

  const ResultScreen(this.score, {Key? key}) : super(key: key);

  @override
  _ResultScreenState createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
  @override
  Widget build(BuildContext context) {
    Color mainColor = Color(0xFF252c4a);
    Color secondColor = Color(0xFF117eeb);
    return Scaffold(
      backgroundColor: mainColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "Congratulations",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 38.0,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 20.0,
            ),
            Text(
              "Your Score is:",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 28.0,
                  fontWeight: FontWeight.w400),
            ),
            SizedBox(
              height: 50.0,
            ),
            Text(
              "${widget.score} / 10",
              style: TextStyle(
                color: Colors.green,
                fontSize: 80.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 60.0,
            ),
            MaterialButton(
              onPressed: () {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => HomePage()));
              },
              color: Colors.amber,
              textColor: Colors.white,
              child: Text(
                "Repeat the Quizz",
              ),
            )
          ],
        ),
      ),
    );
  }
}
