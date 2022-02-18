import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
              Icons.person,
              color: Colors.blue,
              size: 50.0,
          ),
          Text(
            'User',
            style: TextStyle(
                color: Colors.blue,
                fontWeight: FontWeight.bold,
                fontStyle: FontStyle.italic,
                fontSize: 50.0,
                letterSpacing: 5.0,
                decoration: TextDecoration.none,
                backgroundColor: Colors.white
            ),
          )
        ],
      ),
    );
  }
}
