import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:quizz_app/screens/quizz_page.dart';
import 'package:quizz_app/screens/home_screen.dart';
import 'package:quizz_app/model/result_model.dart';

class ResultScreen extends StatefulWidget {
  final int score;

  const ResultScreen(this.score, {Key? key}) : super(key: key);

  @override
  _ResultScreenState createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
  List<ResultModel> results = [
    ResultModel(
        image: "images/0.jpg",
        headMessage: "WHAT WAS THAT?",
        customMessage:
            "you did this on purpose just to see what\n\tI would say right?",
        color: Colors.red[700]),
    ResultModel(
        image: "images/1.jpg",
        headMessage: "DEPLORABLE!",
        customMessage: "are you sure you picked the right quizz?",
        color: Colors.red),
    ResultModel(
        image: "images/2.png",
        headMessage: "YIKES!",
        customMessage: "that's pretty bad, not gonna lie!",
        color: Colors.red),
    ResultModel(
        image: "images/3.png",
        headMessage: "NOT TOO BAD",
        customMessage: "you can certainly do better, right?!",
        color: Colors.red),
    ResultModel(
        image: "images/4.jpg",
        headMessage: "COULD BE WORSE",
        customMessage: "be honest... You only watched\n\tthe movies right?",
        color: Colors.red),
    ResultModel(
        image: "images/5.jpg",
        headMessage: "ENOUGH",
        customMessage: "hey! You had half the questions right!",
        color: Colors.orange),
    ResultModel(
        image: "images/6.jpg",
        headMessage: "NICE!",
        customMessage: "well done. You can always read more\n\tto learn more",
        color: Colors.orange),
    ResultModel(
        image: "images/7.jpg",
        headMessage: "GOOD!",
        customMessage: "very nice! you certainly know the saga",
        color: Colors.orange),
    ResultModel(
        image: "images/8.png",
        headMessage: "VERY GOOD!",
        customMessage: "good job! You made Potterheads\n\taround the world proud",
        color: Colors.green),
    ResultModel(
        image: "images/9.png",
        headMessage: "AMAZING!",
        customMessage: "one short of perfection,\n\tbut you are a true fan",
        color: Colors.green),
    ResultModel(
        image: "images/10.png",
        headMessage: "EXCELLENT!",
        customMessage: "you really are a legitimate\n\tPotterhead",
        color: Colors.green),
  ];

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
              "${results[widget.score].headMessage}",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 38.0,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 10.0,
            ),
            Container(
              child: Image.asset(
                results[widget.score].image,
                fit: BoxFit.fitHeight,
                height: 140.0,
                width: 1000.0,
              ),
            ),
            SizedBox(
              height: 40.0,
            ),
            Text(
              "Your Score is:",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 28.0,
                  fontWeight: FontWeight.w400),
            ),
            SizedBox(
              height: 10.0,
            ),
            Text(
              "${widget.score} / 10",
              style: TextStyle(
                color: results[widget.score].color,
                fontSize: 80.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            Stack(alignment: Alignment.center, children: [
              Container(
                child: Image.asset(
                  "images/frame.png",
                  fit: BoxFit.fitWidth,
                  height: 140.0,
                  width: 370.0,
                ),
              ),
              Center(
                child: Text(
                  "${results[widget.score].customMessage}",
                  style: TextStyle(
                      fontSize: 20.0,
                      color: Colors.white,
                      fontWeight: FontWeight.w300,
                      fontStyle: FontStyle.italic),
                ),
              ),
            ]),
            SizedBox(
              height: 60.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                MaterialButton(
                  onPressed: () {
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) => QuizzPage()));
                  },
                  color: secondColor,
                  textColor: Colors.white,
                  child: Text(
                    "Try Again",
                  ),
                ),
                MaterialButton(
                  onPressed: () {
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) => HomePage()));
                  },
                  color: Colors.redAccent,
                  textColor: Colors.white,
                  child: Text(
                    "Home Page",
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
