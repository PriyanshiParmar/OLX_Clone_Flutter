import 'package:ecommerce/ui/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized(); //Do binding before app is started
  await Firebase.initializeApp(); //Initialize firebase before starting application
  runApp(MyApp());  //Run application
}

class MyApp extends StatelessWidget {

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(  //adapt screen and font size
      designSize: Size(375, 812), //Size of physical device

      builder: (context, child) => MaterialApp(
          debugShowCheckedModeBanner: false,  //set debug mode to false
          title: 'OLX Application',
          theme: ThemeData(     //Overall configuration of theme
            primarySwatch: Colors.blue,
          ),
           home:SplashScreen (),
        )
    );
  }
}
