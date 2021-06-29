import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:login/elements/signup.dart';
import 'package:login/ui/texts.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  String? _email;
  String? _password;
  Future<void> _createuser() async {
    print("Email: $_email password: $_password");
    print(_password);

    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: _email, password: _password);
      print("User: $userCredential");
    } on FirebaseException catch (e) {
      print("error $e");
    } catch (e) {
      print("error $e");
    }
  }

  Future<void> _loginuser() async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: _email, password: _password);
      print("User: $userCredential");
    } on FirebaseException catch (e) {
      print("error $e");
    } catch (e) {
      print("error $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formkey,
        child: Container(
            color: Colors.white,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 250),
                Container(
                    child: Text('Login',
                        style: TextStyle(
                            fontSize: 25,
                            color: Colors.black,
                            fontWeight: FontWeight.bold))),
                Container(
                  margin: EdgeInsets.only(top: 10, left: 20, right: 20),
                  child: TextFormField(
                    onChanged: (value) {
                      _email = value;
                      print('email: $value');
                    },
                    keyboardType: TextInputType.text,
                    decoration: Texts.primary('email'),
                    style: Texts.purple1(),
                    // onSaved: (String? name) {
                    //  signupmodel.name = name;
                    // },
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Please enter EMAIL";
                      }
                      return null;
                    },
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 10, left: 20, right: 20),
                  child: TextFormField(
                    onChanged: (value) {
                      _password = value;
                    },
                    decoration: Texts.primary('password'),
                    style: Texts.purple1(),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "plz enter the password";
                      }
                      return null;
                    },
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 10, left: 20, right: 20),
                  height: 65,
                  width: MediaQuery.of(context).size.width,
                  color: Colors.white,
                  child: RaisedButton(
                      color: Colors.brown[600],
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      onPressed: () {
                        if (_formkey.currentState!.validate()) {
                          _loginuser();
                          Fluttertoast.showToast(
                              msg: "login successfull",
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.BOTTOM,
                              timeInSecForIosWeb: 2,
                              backgroundColor: Colors.purple,
                              textColor: Colors.white,
                              fontSize: 14.0);
                        } else {
                          Fluttertoast.showToast(
                              msg: "enter the usename and password",
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.BOTTOM,
                              timeInSecForIosWeb: 2,
                              backgroundColor: Colors.purpleAccent,
                              textColor: Colors.white,
                              fontSize: 14.0);
                        }
                      },
                      child: Text(
                        "Login",
                        style: TextStyle(color: Colors.white, fontSize: 25),
                      )),
                ),

                /* child: RaisedButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      child: Text(
                        "LOG IN",
                        style: Texts.white(),
                      ),
                      padding: const EdgeInsets.all(10),
                      color: Colors.pink[300],
                      onPressed: () {
                        _loginuser();
                        /* if (_formkey.currentState!.validate()) {
                                        _formkey.currentState!.save();
                                        showAlertDialog(context);
                                        _loginButtonAction();
                                      } else {
                                        Fluttertoast.showToast(
                                            msg: "Please enter all the details",
                                            toastLength: Toast.LENGTH_SHORT,
                                            gravity: ToastGravity.BOTTOM,
                                            timeInSecForIosWeb: 2,
                                            backgroundColor:
                                                ThemeConfig.darkAccent,
                                            textColor: Colors.white,
                                            fontSize: 14.0);
                                      }
                                      // Navigator.push(
                                      //     context,
                                      //     MaterialPageRoute(
                                      //         builder: (context) => Homepage()));
                                    },*/
                      }), */

                Center(
                  child: Row(
                    children: [
                      Center(
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Signup()));
                          },
                          child: Container(
                            margin: EdgeInsets.only(top: 10, left: 30),
                            child: Center(
                              child: RichText(
                                text: TextSpan(
                                  children: <TextSpan>[
                                    TextSpan(
                                      text: 'Don’t have an Account ?',
                                      style: TextStyle(
                                          fontSize: 30,
                                          color: Colors.black,
                                          fontWeight: FontWeight.normal),
                                    ),
                                    TextSpan(
                                        text: ' Register',
                                        style: TextStyle(
                                            color: Colors.grey,
                                            fontSize: 35,
                                            decoration:
                                                TextDecoration.underline))
                                  ],
                                ),
                                textScaleFactor: 0.5,
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            )),
      ),
    );
  }
}
