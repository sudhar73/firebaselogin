import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Hoempage extends StatefulWidget {
  Hoempage({Key? key}) : super(key: key);

  @override
  _HoempageState createState() => _HoempageState();
}

class _HoempageState extends State<Hoempage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("HomePage")),
      body: Center(
        child: Container(
          color: Colors.pink,
          child: Column(
            children: [
              Container(
                  child: Text("this is homepage",
                      style: TextStyle(color: Colors.yellow, fontSize: 25))),
              MaterialButton(
                  onPressed: () async {
                    await FirebaseAuth.instance.signOut();
                  },
                  child: Text("signout")),
            ],
          ),
        ),
      ),
    );
  }
}
