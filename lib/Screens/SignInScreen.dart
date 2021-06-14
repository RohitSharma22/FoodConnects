// ignore: unused_import
import 'package:firebase_auth/firebase_auth.dart';
// ignore: unused_import
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
// ignore: unused_import
import 'package:signup_ui/Screens/HomePage.dart';
// ignore: unused_import
// ignore: duplicate_import
// ignore: unused_import
// ignore: duplicate_import
// ignore: unused_import
// ignore: duplicate_import
// ignore: unused_import

class SignInScreen extends StatefulWidget {
  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  TextEditingController _email = new TextEditingController();
  TextEditingController _password = new TextEditingController();

  Future<void> signin(BuildContext context) async {
    try {
      // ignore: unused_local_variable
      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(
              email: _email.text, password: _password.text);
    } catch (e) {
      print(e);
    }

    print("Sign in Sucessfull!!");
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => HomePage()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        children: <Widget>[
          Container(
            height: 300,
            decoration: BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.cover, image: AssetImage('asset/img/app.png'))),
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              children: <Widget>[
                IconButton(icon: Icon(Icons.email), onPressed: null),
                Expanded(
                    child: Container(
                        margin: EdgeInsets.only(right: 20, left: 10),
                        child: TextField(
                          decoration: InputDecoration(hintText: 'Email'),
                          controller: _email,
                        )))
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              children: <Widget>[
                IconButton(icon: Icon(Icons.lock), onPressed: null),
                Expanded(
                    child: Container(
                        margin: EdgeInsets.only(right: 20, left: 10),
                        child: TextField(
                          decoration: InputDecoration(hintText: 'Password'),
                          controller: _password,
                        ))),
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(5),
              child: Container(
                height: 60,
                // ignore: deprecated_member_use
                child: RaisedButton(
                  onPressed: () {
                    signin(context);
                  },
                  color: Color(0xFF00a79B),
                  child: Text(
                    'SIGN IN',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          InkWell(
            onTap: () {
              Navigator.pushNamed(context, 'SignUp');
            },
            child: Center(
              child: RichText(
                text: TextSpan(
                    text: 'Don\'t have an account?',
                    style: TextStyle(color: Colors.black),
                    children: [
                      TextSpan(
                        text: 'SIGN UP',
                        style: TextStyle(
                            color: Colors.teal, fontWeight: FontWeight.bold),
                      )
                    ]),
              ),
            ),
          )
        ],
      ),
    );
  }
}
