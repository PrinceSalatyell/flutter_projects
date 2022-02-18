import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../db/users.dart';
import 'home.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  final _formKey = GlobalKey<FormState>();
  UserServices _userServices = UserServices();
  TextEditingController _emailTextController = TextEditingController();
  TextEditingController _passwordTextController = TextEditingController();
  TextEditingController _nameTextController = TextEditingController();
  TextEditingController _confirmPasswordTextController =
      TextEditingController();
  late String gender;
  String groupValue = "male";
  bool hidePass = true;
  bool hideCPass = true;
  bool loading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Image.asset(
            'images/m1.jpeg',
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          ),
//          Container(
//            alignment: Alignment.topCenter,
//            child: Image.asset('images/logo.png',
//            width: 150.0,
//            height: 150.0,),
//          ),
          Container(
            color: Colors.black.withOpacity(0.5),
            width: double.infinity,
            height: double.infinity,
          ),

          Center(
            child: Padding(
              padding: const EdgeInsets.only(top: 250.0),
              child: Center(
                  child: Form(
                key: _formKey,
                child: ListView(children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(14.0, 8.0, 14.0, 8.0),
                    child: Material(
                      borderRadius: BorderRadius.circular(10.0),
                      color: Colors.white.withOpacity(0.4),
                      elevation: 0.0,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 12.0),
                        child: TextFormField(
                          decoration: InputDecoration(
                              hintText: 'Full Name',
                              icon: Icon(Icons.person_outline),
                              border: InputBorder.none),
                          controller: _nameTextController,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "The name field cannot be empty!";
                            }
                            return null;
                          },
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(14.0, 8.0, 14.0, 8.0),
                    child: Material(
                      borderRadius: BorderRadius.circular(10.0),
                      color: Colors.white.withOpacity(0.4),
                      elevation: 0.0,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 12.0),
                        child: TextFormField(
                          decoration: InputDecoration(
                              hintText: 'Email',
                              icon: Icon(Icons.email),
                              border: InputBorder.none),
                          controller: _emailTextController,
                          validator: (value) {
                            if (value!.isEmpty) {
                              Pattern pattern =
                                  r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
                              RegExp regex = RegExp(pattern.toString());
                              if (!regex.hasMatch(value))
                                return 'Please make sure your email address is valid';
                              else
                                return null;
                            }
                          },
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(14.0, 8.0, 14.0, 8.0),
                    child: Container(
                      color: Colors.white.withOpacity(0.4),
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
                      borderRadius: BorderRadius.circular(10.0),
                      color: Colors.white.withOpacity(0.4),
                      elevation: 0.0,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 12.0),
                        child: ListTile(
                          title: TextFormField(
                            decoration: InputDecoration(
                                hintText: 'Password',
                                icon: Icon(Icons.lock_outline),
                                border: InputBorder.none),
                            controller: _passwordTextController,
                            obscureText: hidePass,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "The password field cannot be empty!";
                              } else if (value.length < 6) {
                                return "The password is too short. Make it at least 6 char long!";
                              }
                              return null;
                            },
                          ),
                          trailing: IconButton(
                            icon: Icon(
                              Icons.remove_red_eye,
                            ),
                            onPressed: () {
                              setState(() {
                                hidePass = !hidePass;
                              });
                            },
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(14.0, 8.0, 14.0, 8.0),
                    child: Material(
                      borderRadius: BorderRadius.circular(10.0),
                      color: Colors.white.withOpacity(0.4),
                      elevation: 0.0,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 12.0),
                        child: ListTile(
                          title: TextFormField(
                            decoration: InputDecoration(
                                hintText: 'Confirm Password',
                                icon: Icon(Icons.lock_outline),
                                border: InputBorder.none),
                            controller: _confirmPasswordTextController,
                            obscureText: hideCPass,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "The password field cannot be empty!";
                              } else if (value.length < 6) {
                                return "The password is too short. Make it at least 6 char long!";
                              } else if (_passwordTextController.text !=
                                  value) {
                                return "The Passwords you insertedt do not match!";
                              }
                              return null;
                            },
                          ),
                          trailing: IconButton(
                            icon: Icon(
                              Icons.remove_red_eye,
                            ),
                            onPressed: () {
                              setState(() {
                                hideCPass = !hideCPass;
                              });
                            },
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(14.0, 8.0, 14.0, 8.0),
                    child: Material(
                        borderRadius: BorderRadius.circular(20.0),
                        color: Colors.blue,
                        elevation: 0.0,
                        child: MaterialButton(
                          onPressed: () async{
                            validateForm();
                          },
                          minWidth: MediaQuery.of(context).size.width,
                          child: Text(
                            'Sign Up',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 18.0),
                          ),
                        )),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Text(
                        "I already have an account",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.red,
                            decoration: TextDecoration.underline),
                      ),
                    ),
                  ),
                ]),
              )),
            ),
          ),
          Visibility(
            visible: loading,
            child: Container(
              color: Colors.white.withOpacity(0.7),
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(Colors.red),
              ),
            ),
          ),
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

  Future validateForm() async {
    FormState? formState = _formKey.currentState;

    if (formState!.validate()) {
      formState.reset();
      final User user = firebaseAuth.currentUser!;
      if (user == null) {
        try {
          UserCredential userCredential = await FirebaseAuth.instance
              .createUserWithEmailAndPassword(
                  email: _emailTextController.text,
                  password: _passwordTextController.text)
              .then((value) =>
                  _userServices.createUser({
                    "username": _nameTextController.text,
                    "email": _emailTextController.text,
                    "userId": value.user!.uid,
                    "gender": gender,
                  }));
        } on FirebaseAuthException catch (e) {
          if (e.code == 'weak-password') {
            print('The password provided is too weak.');
          } else if (e.code == 'email-already-in-use') {
            print('The account already exists for this email.');
          }
        } catch (e) {
          print(e);
        }
      }
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => HomePage()));
    }
  }
}
