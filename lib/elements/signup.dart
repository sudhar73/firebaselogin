import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:login/ui/texts.dart';

class Signup extends StatefulWidget {
  @override
  _SignupState createState() => _SignupState();
}

class _SignupState extends State<Signup> {
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Form(
        key: _formkey,
        child: Container(
            child: Column(
          children: [
            SizedBox(height: 250),
            Container(
              child: Text("Sign Up", style: Texts.balckbold()),
            ),
            Container(
              margin: EdgeInsets.only(top: 10, left: 20, right: 20),
              child: TextFormField(
                keyboardType: TextInputType.text,
                decoration: Texts.primary('Name'),
                style: Texts.purple1(),
                onSaved: (String? name) {
                  //  signupmodel.name = name;
                },
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Please enter name";
                  }
                  return null;
                },
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 10, left: 20, right: 20),
              child: TextFormField(
                keyboardType: TextInputType.number,
                decoration: Texts.primary('Phone Number'),
                style: Texts.purple1(),
                validator: (String? value) {
                  if (value!.isEmpty) {
                    return "Please enter  phone";
                  }
                  if (value.length < 9) {
                    return "Please enter valid phone";
                  }
                  return null;
                },
                onSaved: (String? phone) {
                  // signupmodel.phoneno = phone;
                },
              ),
            ),
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
            SizedBox(height: 20),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 60,
              margin: EdgeInsets.only(left: 20, right: 20, top: 10),
              child: RaisedButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                child: Text(
                  "Sign Up",
                  style: Texts.white(),
                ),
                padding: const EdgeInsets.all(10),
                color: Colors.brown[600],
                onPressed: () {
                  if (_formkey.currentState!.validate()) {
                    _createuser();
                    Fluttertoast.showToast(
                        msg: "Regiter successfull",
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.BOTTOM,
                        timeInSecForIosWeb: 2,
                        backgroundColor: Colors.purpleAccent,
                        textColor: Colors.white,
                        fontSize: 14.0);
                    // Homepage();
                    //   _formkey.currentState!.save();
                    //    showAlertDialog(context);
                    //   _loginButtonAction(
                    //     signupmodel.name!,
                    //    signupmodel.phoneno!,
                    //    signupmodel.email!,
                    //    signupmodel.address!,
                    //   signupmodel.graduted!,
                    //   signupmodel.gender!,
                    //   signupmodel.password!);
                    print("Successful");
                  } else {
                    Fluttertoast.showToast(
                        msg: "Please enter all the details",
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.BOTTOM,
                        timeInSecForIosWeb: 2,
                        backgroundColor: Colors.purpleAccent,
                        textColor: Colors.white,
                        fontSize: 14.0);
                  }

                  // Navigator.push(
                  //     context,
                  //     MaterialPageRoute(
                  //         builder: (context) => Homepage()));
                },
              ),
            ),
          ],
        )),
      ),
    ));
  }
}
