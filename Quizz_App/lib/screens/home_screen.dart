import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:quizz_app/screens/quizz_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Color mainColor = Color(0xFF252c4a);
  Color secondColor = Color(0xFF117eeb);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: mainColor,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              alignment: Alignment.center,
              padding: EdgeInsets.only(top: 8.0),
              child: Image.asset(
                "images/Hogwarts_logo.png",
                fit: BoxFit.fill,
                height: 120.0,
                width: 130.0,
              ),
            ),
            SizedBox(
              height: 30.0,
            ),
            Container(
              alignment: Alignment.center,
              child: Image.asset(
                "images/HP_logo1.png",
                fit: BoxFit.fill,
                height: 120.0,
                width: 300.0,
              ),
            ),
            SizedBox(
              height: 1.0,
            ),
            Container(
              alignment: Alignment.center,
              child: Image.asset(
                "images/quizz1.png",
                fit: BoxFit.fill,
                height: 70.0,
                width: 140.0,
              ),
            ),
            SizedBox(
              height: 70,
            ),
            Container(
              height: 180,
              width: 180,
              child: InkWell(
                onTap: () {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => QuizzPage()));
                },
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  elevation: 8,
                  color: Colors.blue[900],
                  child: GridTile(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 16.0),
                      child: Icon(
                        Icons.play_arrow,
                        size: 100,
                        color: Colors.orange[300],
                      ),
                    ),
                    header: Padding(
                      padding: const EdgeInsets.only(left: 8.0, top: 8),
                      child: Text(
                        "Let's Play!",
                        style: TextStyle(
                          color: Colors.orange[300],
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
