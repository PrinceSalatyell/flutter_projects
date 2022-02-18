import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shopapp_course/pages/signup.dart';
import 'home.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  final _formKey = GlobalKey<FormState>();
  TextEditingController _emailTextController = TextEditingController();
  TextEditingController _passwordTextController = TextEditingController();
  late SharedPreferences preferences;
  bool hidePass = true;
  bool loading = false;
  bool isLoggedIn = false;

  @override
  void initState() {
    super.initState();
    isSignedIn();
  }

  void isSignedIn() async {
    setState(() {
      loading = true;
    });
    if (isLoggedIn) {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => HomePage()));
    }
    setState(() {
      loading = false;
    });
  }

//Future handleSignIn() async {
//  preferences = await SharedPreferences.getInstance();
//
//  setState(() {
//    loading = true;
//  });
//}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Image.asset(
            'images/back.jpg',
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
                            hintText: 'Email',
                            icon: Icon(Icons.email),
                            border: InputBorder.none
                          ),
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
                              border: InputBorder.none
                            ),
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
                          trailing: IconButton(icon: Icon(Icons.remove_red_eye,),
                        onPressed: (){
                          setState((){
                            hidePass = !hidePass;
                          });
                        },),
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
                          onPressed: () {},
                          minWidth: MediaQuery.of(context).size.width,
                          child: Text(
                            'Login',
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
                    child: Text(
                      'Forgot password',
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.white, fontSize: 12.0),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: InkWell(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => SignUp()));
                      },
                      child: Text(
                        "Sign Up",
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.red, decoration: TextDecoration.underline),
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
}
