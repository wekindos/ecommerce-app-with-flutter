import 'package:flutter/material.dart';
import 'package:webuy/authentication/auth.dart';
import 'package:webuy/signin/signin.dart';

var indexClicked = 0;

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'WeBuy',
          style: TextStyle(color: Colors.white),
        ),
        actions: [
          Container(
            padding: EdgeInsets.fromLTRB(0, 0, 10, 0),
            child: Icon(Icons.shopping_cart),
          ),
        ],
      ),
      drawer: Drawer(
        child: Column(children: [
          DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.deepPurple,
              ),
              child: Center(
                child: Text(
                  'WeBuy',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                  ),
                ),
              )),

          //end drawer
          Expanded(
            child: ListView(padding: EdgeInsets.zero, children: [
              ListTile(
                leading: Icon(
                  Icons.home,
                ),
                title: Text('Home'),
                onTap: () {
                  setState(() {
                    indexClicked = 0;
                  });
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: Icon(
                  Icons.desktop_mac,
                ),
                title: Text('Desktop'),
                onTap: () {
                  setState(() {
                    indexClicked = 1;
                  });
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: Icon(
                  Icons.laptop,
                ),
                title: Text('Laptops'),
                onTap: () {
                  setState(() {
                    indexClicked = 2;
                  });
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: Icon(
                  Icons.phone,
                ),
                title: Text('Phones'),
                onTap: () {
                  setState(() {
                    indexClicked = 3;
                  });
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: Icon(Icons.desktop_windows),
                title: Text('Television'),
                onTap: () {
                  setState(() {
                    indexClicked = 4;
                  });
                  Navigator.pop(context);
                },
              ),
              SizedBox(
                height: 50,
              ),

              Container(
                child: ElevatedButton(
                  child: Text('Logout', 
                  style: TextStyle(color: Colors.white, 
                  fontWeight: FontWeight.bold),
                  ),
                  onPressed: (){
                    AuthenticationClass()
              .signout()
              .then((_) => Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (contex) => login()),
                  ));
        },
                  
                ),
              )
             
            ]),
          ),
        ]),
      ),
    );
  }
}
