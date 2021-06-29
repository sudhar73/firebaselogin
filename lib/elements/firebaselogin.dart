import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:login/elements/homepage.dart';
import 'package:login/elements/login.dart';
import 'package:login/elements/signup.dart';
import 'package:login/main.dart';

class FirebaseLogin extends StatefulWidget {
  @override
  _FirebaseLoginState createState() => _FirebaseLoginState();
}

class _FirebaseLoginState extends State<FirebaseLogin> {
  final Future<FirebaseApp> _intilasie = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Scaffold(
              body: Center(child: Text("error ${snapshot.error}")),
            );
          }
          if (snapshot.connectionState == ConnectionState.done) {
            return StreamBuilder(
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.active) {
                    Object? user = snapshot.data;

                    if (user == null) {
                      return Login();
                    } else {
                      return Hoempage();
                    }
                  }
                  return Scaffold(
                      body: Center(child: Text("connection to auth")));
                },
                stream: FirebaseAuth.instance.authStateChanges());
          }
          return Scaffold(body: Center(child: Text("connection to app")));
        },
        future: _intilasie);
  }
}
