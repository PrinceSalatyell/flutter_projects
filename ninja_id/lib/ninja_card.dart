import 'package:flutter/material.dart';
import 'create.dart';

class NinjaCard extends StatefulWidget {
  const NinjaCard({Key? key}) : super(key: key);

  @override
  State<NinjaCard> createState() => _NinjaCardState();
}

class _NinjaCardState extends State<NinjaCard> {
  int ninjaLevel = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
          title: const Text('Ninja ID Card'),
          centerTitle: true,
          backgroundColor: Colors.grey[850],
          elevation: 0.0),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(30.0, 40.0, 30.0, 0.0),
        child: ListView(children: [
          const Center(
            child: CircleAvatar(
              backgroundImage: AssetImage('assets/thumb.jpg'),
              radius: 40.0,
            ),
          ),
          Divider(
            height: 90.0,
            color: Colors.grey[800],
          ),
          const Text(
            'NAME',
            style: TextStyle(
              color: Colors.grey,
              letterSpacing: 2.0,
            ),
          ),
          const SizedBox(
            height: 10.0,
          ),
          Text(
            Create.ninja.name,
            style: TextStyle(
              color: Colors.amberAccent[200],
              letterSpacing: 2.0,
              fontSize: 28.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
            height: 30.0,
          ),
          const Text(
            'AGE',
            style: TextStyle(
              color: Colors.grey,
              letterSpacing: 2.0,
            ),
          ),
          const SizedBox(
            height: 10.0,
          ),
          Text(
            Create.ninja.age.toString(),
            style: TextStyle(
              color: Colors.amberAccent[200],
              letterSpacing: 2.0,
              fontSize: 28.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
            height: 30.0,
          ),
          const Text(
            'GENDER',
            style: TextStyle(
              color: Colors.grey,
              letterSpacing: 2.0,
            ),
          ),
          const SizedBox(
            height: 10.0,
          ),
          Text(
            Create.ninja.gender,
            style: TextStyle(
              color: Colors.amberAccent[200],
              letterSpacing: 2.0,
              fontSize: 28.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
            height: 30.0,
          ),
          const Text(
            'SKILLS',
            style: TextStyle(
              color: Colors.grey,
              letterSpacing: 2.0,
            ),
          ),
          const SizedBox(
            height: 10.0,
          ),
          Text(
            printSkills(Create.ninja.skills),
            style: TextStyle(
              color: Colors.amberAccent[200],
              letterSpacing: 2.0,
              fontSize: 28.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
            height: 30.0,
          ),
          const Text(
            'WEAPON',
            style: TextStyle(
              color: Colors.grey,
              letterSpacing: 2.0,
            ),
          ),
          const SizedBox(
            height: 10.0,
          ),
          Text(
            Create.ninja.weapon,
            style: TextStyle(
              color: Colors.amberAccent[200],
              letterSpacing: 2.0,
              fontSize: 28.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
            height: 30.0,
          ),
          const Text(
            'CURRENT NINJA LEVEL',
            style: TextStyle(
              color: Colors.grey,
              letterSpacing: 2.0,
            ),
          ),
          const SizedBox(
            height: 10.0,
          ),
          Text(
            Create.ninja.currentNinjaLevel.toString(),
            style: TextStyle(
              color: Colors.amberAccent[200],
              letterSpacing: 2.0,
              fontSize: 28.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
            height: 30.0,
          ),
          Row(
            children: [
              Icon(
                Icons.email,
                color: Colors.grey[400],
              ),
              const SizedBox(
                width: 10.0,
              ),
              Text(
                Create.ninja.email,
                style: TextStyle(
                    color: Colors.grey[400],
                    fontSize: 18.0,
                    letterSpacing: 1.0),
              ),
            ],
          )
        ]),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            Create.ninja.currentNinjaLevel += 1;
          });
        },
        child: const Icon(
          Icons.upgrade,
          size: 40.0,
        ),
        backgroundColor: Colors.grey[800],
      ),
    );
  }

  String printSkills(List list) {
    String string = '';
    for (String x in list) {
      string += x + ' ';
    }
    return string;
  }
}