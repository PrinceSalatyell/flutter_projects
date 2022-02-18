import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'ninja.dart';
import 'ninja_card.dart';

class Create extends StatefulWidget {

  static late Ninja ninja;

  const Create({Key? key}) : super(key: key);

  @override
  _CreateState createState() => _CreateState();
}

class _CreateState extends State<Create> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _name = TextEditingController();
  TextEditingController _age = TextEditingController();
  TextEditingController _skills = TextEditingController();
  TextEditingController _weapon = TextEditingController();
  TextEditingController _email = TextEditingController();
  String groupValue = "male";
  late String gender;

  bool isNumeric(String s) {
    if (s == null) {
      return false;
    }
    return double.tryParse(s) != null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      body: Stack(
        children: [

          Image.asset(
            'assets/logo.png',
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          ),

          Center(
              child: Padding(
                padding: EdgeInsets.only(top: 50.0),
                child: Center(
                  child: Form(
                    key: _formKey,
                    child: ListView(
                      children: [
                        Container(
                          child: Text(
                            ' CREATE\n               YOUR\n                          NINJA:',
                            style: GoogleFonts.fontdinerSwanky(
                              textStyle: TextStyle(
                                color: Colors.greenAccent,
                                fontSize: 30.0,
                                fontWeight: FontWeight.bold,
                              )
                            )
                          ),
                        ),

                        SizedBox(height: 30.0),

                        Padding(
                          padding: EdgeInsets.fromLTRB(14.0, 8.0, 14.0, 8.0),
                          child: Material(
                            borderRadius: BorderRadius.circular(10.0),
                            color: Colors.amberAccent,
                            elevation: 0.0,
                            child: Padding(
                              padding: EdgeInsets.only(left: 12.0),
                              child: TextFormField(
                                decoration: InputDecoration(
                                    hintText: 'Name',
                                    icon: Icon(Icons.portrait),
                                    border: InputBorder.none
                                ),
                                controller: _name,
                                validator: (value) {
                                  if(value!.isEmpty) {
                                    return "The name field cannot be empty!";
                                  }
                                  return null;
                                },
                              ),
                            ),
                          ),
                        ),

                        Padding(
                          padding: EdgeInsets.fromLTRB(14.0, 8.0, 14.0, 8.0),
                          child: Material(
                            borderRadius: BorderRadius.circular(10.0),
                            color: Colors.redAccent,
                            elevation: 0.0,
                            child: Padding(
                              padding: EdgeInsets.only(left: 12.0),
                              child: TextFormField(
                                decoration: InputDecoration(
                                    hintText: 'Age',
                                    icon: Icon(Icons.support_agent_outlined),
                                    border: InputBorder.none
                                ),
                                controller: _age,
                                validator: (value) {
                                  if(value!.isEmpty) {
                                    return "The name field cannot be empty!";
                                  } else if(!isNumeric(value)) {
                                    return "You must specify you age with numbers!";
                                  }
                                  return null;
                                },
                              ),
                            ),
                          ),
                        ),

                        Padding(
                          padding: EdgeInsets.fromLTRB(14.0, 8.0, 14.0, 8.0),
                          child: Material(
                            borderRadius: BorderRadius.circular(10.0),
                            color: Colors.greenAccent,
                            elevation: 0.0,
                            child: Padding(
                              padding: EdgeInsets.only(left: 12.0),
                              child: TextFormField(
                                decoration: InputDecoration(
                                    hintText: 'Skills',
                                    icon: Icon(Icons.timeline_sharp),
                                    border: InputBorder.none
                                ),
                                controller: _skills,
                              ),
                            ),
                          ),
                        ),

                        Padding(
                          padding: EdgeInsets.fromLTRB(14.0, 8.0, 14.0, 8.0),
                          child: Material(
                            borderRadius: BorderRadius.circular(10.0),
                            color: Colors.blueAccent,
                            elevation: 0.0,
                            child: Padding(
                              padding: EdgeInsets.only(left: 12.0),
                              child: TextFormField(
                                decoration: InputDecoration(
                                    hintText: 'Weapon',
                                    icon: Icon(Icons.pan_tool),
                                    border: InputBorder.none
                                ),
                                controller: _weapon,
                                validator: (value) {
                                  if(value!.isEmpty) {
                                    return "The weapon field cannot be empty!";
                                  }
                                  return null;
                                },
                              ),
                            ),
                          ),
                        ),

                        Padding(
                          padding: EdgeInsets.fromLTRB(14.0, 8.0, 14.0, 8.0),
                          child: Material(
                            borderRadius: BorderRadius.circular(10.0),
                            color: Colors.purpleAccent,
                            elevation: 0.0,
                            child: Padding(
                              padding: EdgeInsets.only(left: 12.0),
                              child: TextFormField(
                                decoration: InputDecoration(
                                    hintText: 'Email',
                                    icon: Icon(Icons.alternate_email),
                                    border: InputBorder.none
                                ),
                                controller: _email,
                                validator: (value) {
                                  if(value!.isEmpty) {
                                    return "The email field cannot be empty!";
                                  }
                                  return null;
                                },
                              ),
                            ),
                          ),
                        ),

                        Padding(
                          padding: const EdgeInsets.fromLTRB(14.0, 8.0, 14.0, 8.0),
                          child: Container(
                            color: Colors.pinkAccent,
                            child: Row(
                              children: [
                                Expanded(
                                  child: ListTile(
                                    title: Text("male",
                                        textAlign: TextAlign.end,
                                        style: TextStyle(color: Colors.white)),
                                    trailing: Radio(
                                        value: "male",
                                        groupValue: groupValue,
                                        onChanged: (e) => valueChanged(e)),
                                  ),
                                ),
                                Expanded(
                                  child: ListTile(
                                    title: Text("female",
                                        textAlign: TextAlign.end,
                                        style: TextStyle(color: Colors.white)),
                                    trailing: Radio(
                                        value: "female",
                                        groupValue: groupValue,
                                        onChanged: (e) => valueChanged(e)),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),

                        Padding(
                          padding: const EdgeInsets.fromLTRB(14.0, 8.0, 14.0, 8.0),
                          child: Material(
                              borderRadius: BorderRadius.circular(20.0),
                              color: Colors.grey[800],
                              elevation: 0.0,
                              child: MaterialButton(
                                onPressed: () {
                                  createNinja();
                                },
                                minWidth: MediaQuery.of(context).size.width,
                                child: Text(
                                  'Create',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18.0),
                                ),
                              )),
                        ),

                      ],
                    ),
                  ),
                ),
              )
          )
        ],
      ),
    );
  }

  valueChanged(e) {
    setState(() {
      if (e == "male") {
        groupValue = e;
        gender = e;
      } else if (e == "female") {
        groupValue = e;
        gender = e;
      }
    });
  }

  void createNinja() {
    Create.ninja = Ninja(_name.text, int.parse(_age.text), _skills.text.split(" "), _weapon.text, _email.text);
    Create.ninja.gender = gender;
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => const NinjaCard()));
  }

}
