import 'dart:async';
// import 'package:ecommerce/ui/user_selection.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce/const/AppColors.dart';
import 'package:ecommerce/ui/login_screen.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {    //called when an object of this class is created
    //Navigator - transition from one page to other
    //            Maintains a stack
    //Navigator.push - Adds route to stack of routes managed by navigator
    //CupertinoPageRoute - Replace entire screen with an iOS transition
    Timer(Duration(seconds: 3),()=>Navigator.push(context, CupertinoPageRoute(builder: (_)=>LoginPage()))); //Goto UserSelection() after 3 seconds
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.deep_orange,
      body: SafeArea( //Places child in such a way that avoid intrusions by os
        child: Center(
          child: Column(    //A column in center
            mainAxisAlignment: MainAxisAlignment.center,  //Place child close to middle of main axis
            crossAxisAlignment: CrossAxisAlignment.center,    //Place child close to middle of cross axis
            children: [ //children of column - text, sizedbox, circularprogressindicator
              Text(
                "OLX",
                style: TextStyle(               //Styling for text
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 44.sp),
              ),
              SizedBox(
                height: 20.h,   //Creates child(since not specified here so box) of specified dimensions
              ),
              CircularProgressIndicator(    //Shows a progressing circle
                color: Colors.white,      //Deciding color of progressing circle
              ),
            ],
          ),
        ),
      ),
    );
  }
}
