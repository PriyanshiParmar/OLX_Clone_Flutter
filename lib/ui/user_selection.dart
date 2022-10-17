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
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
      debugShowCheckedModeBanner: false,
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
      backgroundColor: AppColors.deep_orange,
      body: SafeArea(
        child: Center(
          child: Column(
          mainAxisAlignment: MainAxisAlignment.center,

          children: <Widget>[
            ElevatedButton(
              // splashColor: Colors.red,
              // textColor: Colors.white,
              child: Text('Buyer',),
              onPressed: () {
                Navigator.push(context, CupertinoPageRoute(builder: (_)=>LoginScreen()));
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
