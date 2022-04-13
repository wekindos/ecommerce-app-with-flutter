import 'package:flutter/material.dart';
import 'package:webuy/home/test.dart';
import 'package:webuy/signin/signin.dart';
import 'package:webuy/signup/signup.dart';

import 'homepage.dart';

class homePage extends StatefulWidget {
  const homePage({Key? key}) : super(key: key);

  @override
  State<homePage> createState() => _homePageState();
}

class _homePageState extends State<homePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Container(
            height: 300,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(bottomLeft: Radius.circular(70)),
              color: Colors.deepPurple,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Center(
                  child: Text(
                    'Welcome to WeBuy',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 30),
                  ),
                ),
                Center(
                  child: Text('Home of Quality',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                          fontSize: 25)),
                ),
                Center(
                  child: Text('Product',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w300,
                          fontSize: 20)),
                ),
              ],
            ),
          ),
          SizedBox(height: 50,),
          Container(
            decoration: BoxDecoration(
            ),
            child: Column(children: [
              ElevatedButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: 
                        (context) => register()));
                  },
                  style: ElevatedButton.styleFrom(
                    fixedSize: Size(300, 50),
                  ),
                  child: Text('Sign Up'))
            ]),
          ),
           SizedBox(height: 50,),
          Container(
            decoration: BoxDecoration(
            ),
            child: Column(children: [
              ElevatedButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => login()));
                  },
                  style: ElevatedButton.styleFrom(
                    fixedSize: Size(300, 50),
                  ),
                  child: Text('Sign in'))
            ]),
          ),

           SizedBox(height: 50,),
          Container(
            decoration: BoxDecoration(

            ),
            child: Column(children: [
              FlatButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => HomePage()));
                  },
                  
                  child: Text('Sign in as a guest',
                  style: TextStyle(color: Colors.deepPurple, fontSize: 20, fontWeight: FontWeight.bold),)),
            ]),
          ),
         SizedBox(height: 90,),

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
