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
            SizedBox(height: 30.0,),
            Container(
              alignment: Alignment.center,
              child: Image.asset(
                "images/HP_logo1.png",
                fit: BoxFit.fill,
                height: 120.0,
                width: 300.0,
              ),
            ),
            SizedBox(height: 1.0,),
            Container(
              alignment: Alignment.center,
              child: Image.asset(
                "images/quizz1.png",
                fit: BoxFit.fill,
                height: 70.0,
                width: 140.0,
              ),
            ),
            SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                MenuItem(title: "New Player", color: Colors.blue[900], icon: Icons.person_add_outlined, action: 1,),
                MenuItem(title: "Existing Player", color: Colors.blue[900], icon: Icons.person_pin_sharp, action: 2,),
              ],
            ),
            SizedBox(height: 30.0,),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Colors.blue[900],
                fixedSize: Size(150, 40),
                onPrimary: Colors.orange[300]
              ),
              onPressed: (){},
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Rankings"
                  ),
                  SizedBox(width: 10,),
                  Icon(Icons.query_stats)
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class MenuItem extends StatelessWidget {
  final String title;
  final Color? color;
  final IconData icon;
  final int action;

  const MenuItem({
    Key? key,
    required this.title,
    required this.color,
    required this.icon,
    required this.action,
  }) : super(key: key);

  createAlertDialog1(BuildContext context) {
    return showDialog(context: context, builder: (context){
      return AlertDialog(
        backgroundColor: Color(0xFF117eeb),
        title: const Text('Name:'),
        content: TextFormField(
          keyboardType: TextInputType.name,
        ),
        actions: [
          MaterialButton(
            color: Colors.amber[700],
            elevation: 5.0,
            child: const Text('confirmar', style: TextStyle(color: Colors.white),),
            onPressed: () {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => QuizzPage()));
            },
          )
        ],
      );
    });
  }

  createAlertDialog2(BuildContext context) {
    return showDialog(context: context, builder: (context){
      return AlertDialog(
        backgroundColor: Color(0xFF117eeb),
        title: const Text('Welcome back!'),
        content: SingleChildScrollView(
          child: Container(),
        ),
        actions: [
          MaterialButton(
            color: Colors.amber[700],
            elevation: 5.0,
            child: const Text('confirmar', style: TextStyle(color: Colors.white),),
            onPressed: () {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => QuizzPage()));
            },
          )
        ],
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 180,
      width: 180,
      child: InkWell(
        onTap: () {
          action == 1 ? createAlertDialog1(context) : createAlertDialog2(context);
        },
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          elevation: 8,
          color: color,
          child: GridTile(
            child: Padding(
              padding: const EdgeInsets.only(top: 16.0),
              child: Icon(icon, size: 100, color: Colors.orange[300],),
            ),
            header: Padding(
              padding: const EdgeInsets.only(left:8.0, top: 8),
              child: Text(
                '$title',
                style: TextStyle(
                  color: Colors.orange[300],
                  fontSize: 20,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}