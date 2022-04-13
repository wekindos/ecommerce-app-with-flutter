import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:webuy/authentication/auth.dart';
import 'package:webuy/home/test.dart';
import 'package:webuy/signup/signup.dart';

import '../home/homepage.dart';

class login extends StatefulWidget {
  const login({Key? key}) : super(key: key);

  @override
  State<login> createState() => _loginState();
}

class _loginState extends State<login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: <Widget>[
          Column(
            children: [
              Container(
                height: 250,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.deepPurple,
                  borderRadius:
                      BorderRadius.only(bottomLeft: Radius.circular(70)),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Welcome Back....!',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 30,
                      ),
                    ),
                    Text(
                      'Sign In here',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        fontSize: 25,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.all(10),
                child: loginForm(),
              ),
            ],
          )
        ],
      ),
    );
  }
}

class loginForm extends StatefulWidget {
  const loginForm({Key? key}) : super(key: key);

  @override
  State<loginForm> createState() => _loginFormState();
}

class _loginFormState extends State<loginForm> {
  final _formKey = GlobalKey<FormState>();

  String? email;
  String? password;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          SizedBox(
            height: 30,
          ),
          Container(
            height: 50,
            padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
            decoration: BoxDecoration(
              color: Colors.black12,
              borderRadius: BorderRadius.circular(30),
            ),
            child: TextFormField(
              decoration: InputDecoration(
                hintText: 'Email Address',
                border: InputBorder.none,
              ),
              onSaved: (val) {
                email = val;
              },
              validator: (value) {
                if (value!.isEmpty) {
                  return "Please Enter your Email";
                }
                return null;
              },
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            height: 50,
            padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
            decoration: BoxDecoration(
              color: Colors.black12,
              borderRadius: BorderRadius.circular(30),
            ),
            child: TextFormField(
              obscureText: true,
              decoration: InputDecoration(
                hintText: 'Password',
                border: InputBorder.none,
              ),
              onSaved: (val) {
                password = val;
              },
              validator: (value) {
                if (value!.isEmpty) {
                  return "Please Enter your Password";
                }
                return null;
              },
            ),
          ),
          SizedBox(
            height: 40,
          ),
          SizedBox(
            height: 50,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                fixedSize: Size(150, 50),
              ),
              onPressed: () {
                // back code
                if (_formKey.currentState!.validate()) {
                  _formKey.currentState!.save();
                  AuthenticationClass()
                      .signinMethod(email: email!, password: password!)
                      .then((result) {
                    if (result == null) {
                      Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (context) =>HomePage()));
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text(result),
                      ));
                    }
                  });
                }
              },
              child: Text('Sign In'),
            ),
          ),
           SizedBox(height: 100,),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(Icons.copyright,size: 20,color: Colors.deepPurple,),
              Text('\t 2022 WekindosDev', style: TextStyle(color:Colors.deepPurple, fontSize: 18, fontWeight: FontWeight.w500),)
            ],
          )
        ],
      ),
    );
  }
}
