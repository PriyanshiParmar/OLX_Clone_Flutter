import 'package:ecommerce/const/AppColors.dart';
import 'package:ecommerce/ui/login_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class UserSelection extends StatelessWidget {
// This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FlatButton',
      theme: ThemeData(                 //Overall configuration of theme
        primarySwatch: Colors.blue, // primarySwatch - not color, but material color - MaterialApp uses diffrent shades of this color
      ),
      home: MyHomePage(),
      debugShowCheckedModeBanner: false,    //set debug mode to false
    );
  }
}
class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String txt='';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.deep_orange,   //Using color declared in AppColors()
      body: SafeArea(   //Places child in such a way that avoid intrusions by os
        child: Center(
          child: Column(    //A column in center
          mainAxisAlignment: MainAxisAlignment.center,    //Place child close to middle of main axis

          children: [
            ElevatedButton(
              // splashColor: Colors.red,
              // textColor: Colors.white,
              child: Text('Buyer',),
              onPressed: () {
                //Navigator - transition from one page to other
                //            Maintains a stack
                //Navigator.push - Adds route to stack of routes managed by navigator
                //CupertinoPageRoute - Replace entire screen with an iOS transition
                Navigator.push(context, CupertinoPageRoute(builder: (_)=>LoginPage()));
              },
            ),

            Text(txt,textScaleFactor: 2),
          ],
        ),
      ),
    ),
    );
  }
}
