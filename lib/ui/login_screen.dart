import 'package:ecommerce/ui/registration_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:ecommerce/const/AppColors.dart';
import 'package:ecommerce/ui/bottom_nav_controller.dart';
// import 'package:ecommerce/ui/registration_screen.dart';
// import 'package:ecommerce/widgets/customButton.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
//
// class LoginScreen extends StatefulWidget {
//   @override
//   _LoginScreenState createState() => _LoginScreenState();
// }
//
// class _LoginScreenState extends State<LoginScreen> {
//
//   //TextEditingController - Controller for editable text field
//
//   TextEditingController _emailController = TextEditingController();
//   TextEditingController _passwordController = TextEditingController();
//   bool _obscureText = true;
//
//   signIn()async{      //Asynchronous function
//     try {
//       //Using firebase authentication
//       //FirebaseAuth.instance - Creates an instance of FirebaseAuth
//       //signInWithEmailAndPassword - sign with existing email and password
//       UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(   //Don't proceed until it is completed
//           email: _emailController.text,     //Passing email as a parameter
//           password: _passwordController.text    //Passing password as a parameter
//       );
//       var authCredential = userCredential.user;
//       print(authCredential!.uid);
//       if(authCredential.uid.isNotEmpty){    //If uid is not empty(user exist) go to BottomNavController
//         //Navigator - transition from one page to other
//         //            Maintains a stack
//         //Navigator.push - Adds route to stack of routes managed by navigator
//         //CupertinoPageRoute - Replace entire screen with an iOS transition
//         Navigator.push(context, CupertinoPageRoute(builder: (_)=>BottomNavController()));
//       }
//       else{
//         //Fluttertoast - shows specified message at bottom of device screen
//         Fluttertoast.showToast(msg: "Something is wrong");
//       }
//
//     } on FirebaseAuthException catch (e) {    //catch exception
//       if (e.code == 'user-not-found') {
//         Fluttertoast.showToast(msg: "No user found for that email.");
//
//       } else if (e.code == 'wrong-password') {
//         Fluttertoast.showToast(msg: "Wrong password provided for that user.");
//
//       }
//     } catch (e) {
//       print(e);
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: AppColors.deep_orange,
//       body: SafeArea(   //Places child in such a way that avoid intrusions by os
//         child: Column(
//           children: [   //Two children of column - SizedBox, Expanded
//             SizedBox(     //Creates a child element of specified width and height
//               height: 150.h,
//               width: ScreenUtil().screenWidth,    //Width = Size of device
//               child: Padding(
//                 padding: EdgeInsets.only(left: 20.w), //EdgeInsets - offsets in all four directions //Here only left side
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,    //Place child close to start of cross axis
//                   mainAxisAlignment: MainAxisAlignment.start,     //Place child close to start of main axis
//                   children: [
//                     IconButton(     //Design icon button that responds to action
//                       onPressed: null,      //Disable the button
//                       icon: Icon(     //Creates an icon - not interactive
//                         Icons.light,    //Specifying icon to be displayed
//                         color: Colors.transparent,
//                       ),
//                     ),
//                     Text(
//                       "Sign In",
//                       style: TextStyle(fontSize: 22.sp, color: Colors.white),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//             Expanded( //Expand child so that it occupies available space
//               child: Container(
//                 width: ScreenUtil().screenWidth,    //Width = Width of device
//                 decoration: BoxDecoration(        //Class to define specification for box
//                   color: Colors.white,
//                   borderRadius: BorderRadius.only(    //Apply BorderRadius to only specified corners
//                     topLeft: Radius.circular(28.r),
//                     topRight: Radius.circular(28.r),
//                   ),
//                 ),
//                 child: Padding(
//                   padding: EdgeInsets.all(20.w),    //Apply padding of 20 in all directions
//                   child: SingleChildScrollView(     //A box in which only single widget can be scrolled
//                     scrollDirection: Axis.vertical,   //Scroll in vertical direction
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,     //Place child close to start of cross axis
//                       children: [
//                         SizedBox(       //Creates child(since not specified here so box) of specified dimensions
//                           height: 20.h,
//                         ),
//                         Text(
//                           "Welcome Back",
//                           style: TextStyle(
//                               fontSize: 22.sp, color: AppColors.deep_orange),
//                         ),
//                         Text(
//                           "Glad to see you back my buddy.",
//                           style: TextStyle(
//                             fontSize: 14.sp,
//                             color: Color(0xFFBBBBBB),
//                           ),
//                         ),
//                         SizedBox(         //Creates child(since not specified here so box) of specified dimensions
//                           height: 15.h,
//                         ),
//                         Row(
//                           children: [
//                             Container(
//                               height: 48.h,
//                               width: 41.w,
//                               decoration: BoxDecoration(      //Specifications for box inside this class
//                                   color: AppColors.deep_orange,
//                                   borderRadius: BorderRadius.circular(12.r)),
//                               child: Center(
//                                 child: Icon(
//                                   Icons.email_outlined,
//                                   color: Colors.white,
//                                   size: 20.w,
//                                 ),
//                               ),
//                             ),
//                             SizedBox(         //Creates child(since not specified here so box) of specified dimensions
//                               width: 10.w,
//                             ),
//                             Expanded(
//                               child: TextField(
//                                 controller: _emailController,   //controls which scroll view is scrolled
//                                 decoration: InputDecoration(
//                                   hintText: "thed9954@gmail.com",
//                                   hintStyle: TextStyle(
//                                     fontSize: 14.sp,
//                                     color: Color(0xFF414041),
//                                   ),
//                                   labelText: 'EMAIL',
//                                   labelStyle: TextStyle(
//                                     fontSize: 15.sp,
//                                     color: AppColors.deep_orange,
//                                   ),
//                                 ),
//                               ),
//                             ),
//                           ],
//                         ),
//                         SizedBox(         //Creates child(since not specified here so box) of specified dimensions
//                           height: 10.h,
//                         ),
//                         Row(
//                           children: [
//                             Container(
//                               height: 48.h,
//                               width: 41.w,
//                               decoration: BoxDecoration(
//                                   color: AppColors.deep_orange,
//                                   borderRadius: BorderRadius.circular(12.r)),
//                               child: Center(
//                                 child: Icon(
//                                   Icons.lock_outline,
//                                   color: Colors.white,
//                                   size: 20.w,
//                                 ),
//                               ),
//                             ),
//                             SizedBox(       //Creates child(since not specified here so box) of specified dimensions
//                               width: 10.w,
//                             ),
//                             Expanded(
//                               child: TextField(
//                                 controller: _passwordController,
//                                 obscureText: _obscureText,
//                                 decoration: InputDecoration(
//                                   hintText: "password must be 6 character",
//                                   hintStyle: TextStyle(
//                                     fontSize: 14.sp,
//                                     color: Color(0xFF414041),
//                                   ),
//                                   labelText: 'PASSWORD',
//                                   labelStyle: TextStyle(
//                                     fontSize: 15.sp,
//                                     color: AppColors.deep_orange,
//                                   ),
//                                   suffixIcon: _obscureText == true
//                                       ? IconButton(
//                                       onPressed: () {
//                                         setState(() {
//                                           _obscureText = false;
//                                         });
//                                       },
//                                       icon: Icon(
//                                         Icons.remove_red_eye,
//                                         size: 20.w,
//                                       ))
//                                       : IconButton(
//                                       onPressed: () {
//                                         setState(() {
//                                           _obscureText = true;
//                                         });
//                                       },
//                                       icon: Icon(
//                                         Icons.visibility_off,
//                                         size: 20.w,
//                                       )),
//                                 ),
//                               ),
//                             ),
//                           ],
//                         ),
//
//                         SizedBox(         //Creates child(since not specified here so box) of specified dimensions
//                           height: 50.h,
//                         ),
//                         // elevated button
//                         customButton("Sign In", (){
//                           signIn();
//                         },),
//                         SizedBox(         //Creates child(since not specified here so box) of specified dimensions
//                           height: 20.h,
//                         ),
//                         Wrap(   //wrap children either in vertical or horizontal
//                           children: [
//                             Text(
//                               "Don't have an account?",
//                               style: TextStyle(
//                                 fontSize: 13.sp,
//                                 fontWeight: FontWeight.w600,
//                                 color: Color(0xFFBBBBBB),
//                               ),
//                             ),
//                             GestureDetector(        //Class used to detect gestures
//                               child: Text(
//                                 " Sign Up",
//                                 style: TextStyle(
//                                   fontSize: 13.sp,
//                                   fontWeight: FontWeight.w600,
//                                   color: AppColors.deep_orange,
//                                 ),
//                               ),
//                               onTap: () {       //call this function when tapped
//                                 //Navigator.push - Adds route to stack of routes managed by navigator
//                                 Navigator.push(       //Navigator - transition from one page to other   //Maintains a stack
//                                     context,
//                                     CupertinoPageRoute(           //CupertinoPageRoute - Replace entire screen with an iOS transition
//                                         builder: (context) =>
//                                             RegistrationScreen())); //Got to RegistrationScreen
//                               },
//                             )
//                           ],
//                         )
//                       ],
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

//
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
//import 'package:google_sign_in/google_sign_in.dart';

// import 'package:wallcraft/controller/auth_controller.dart';
// import 'package:wallcraft/views/resetpassword.dart';
// import 'package:wallcraft/views/signup_page.dart';
// import 'package:get/get.dart';

class _LoginPageState extends State<LoginPage> {
  // var emailController = TextEditingController();
  // var passwordController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

    signIn()async{      //Asynchronous function
      try {
      //Using firebase authentication
      //FirebaseAuth.instance - Creates an instance of FirebaseAuth
      //signInWithEmailAndPassword - sign with existing email and password
      UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(   //Don't proceed until it is completed
          email: _emailController.text,     //Passing email as a parameter
          password: _passwordController.text    //Passing password as a parameter
      );
      var authCredential = userCredential.user;
      print(authCredential!.uid);
      if(authCredential.uid.isNotEmpty){    //If uid is not empty(user exist) go to BottomNavController
        //Navigator - transition from one page to other
        //            Maintains a stack
        //Navigator.push - Adds route to stack of routes managed by navigator
        //CupertinoPageRoute - Replace entire screen with an iOS transition
        Navigator.push(context, CupertinoPageRoute(builder: (_)=>BottomNavController()));
      }
      else{
        //Fluttertoast - shows specified message at bottom of device screen
        Fluttertoast.showToast(msg: "Something is wrong");
      }

    } on FirebaseAuthException catch (e) {    //catch exception
      if (e.code == 'user-not-found') {
        Fluttertoast.showToast(msg: "No user found for that email.");

      } else if (e.code == 'wrong-password') {
        Fluttertoast.showToast(msg: "Wrong password provided for that user.");

      }
    } catch (e) {
      print(e);
    }
  }


  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.white),
          title: Text('Login'),
          centerTitle: true,
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [
                  Colors.blue,
                  Colors.indigo,
                ],
              ),
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: w,
                height: h * 0.35,
                margin: EdgeInsets.only(top: 1),
                decoration: const BoxDecoration(
                    image: DecorationImage(
                      //image: NetworkImage("https://storyset.com/illustration/privacy-policy/rafiki#0D77E1FF&hide=&hide=complete"),
                      image: AssetImage("assets/login.png"),
                      fit: BoxFit.cover,
                    )),
              ),
              Container(
                width: w,
                margin: const EdgeInsets.only(left: 20, right: 20, top: 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Hello",
                      style: TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Text(
                      "Sign in to your account",
                      style: TextStyle(fontSize: 20, color: Colors.grey),
                    ),
                    const SizedBox(height: 20),
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(30),
                          boxShadow: [
                            BoxShadow(
                                blurRadius: 10,
                                spreadRadius: 7,
                                offset: const Offset(1, 1),
                                color: Colors.grey.withOpacity(0.2))
                          ]),
                      child: TextField(
                        controller: _emailController,
                        decoration: InputDecoration(
                            hintText: "Email",
                            prefixIcon: const Icon(
                              Icons.email,
                              color: Colors.blue,
                            ),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                                borderSide: const BorderSide(
                                    color: Colors.white, width: 1.0)),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                                borderSide: const BorderSide(
                                    color: Colors.white, width: 1.0)),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30))),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(30),
                          boxShadow: [
                            BoxShadow(
                                blurRadius: 10,
                                spreadRadius: 7,
                                offset: const Offset(1, 1),
                                color: Colors.grey.withOpacity(0.2))
                          ]),
                      child: TextField(
                        controller: _passwordController,
                        obscureText: true,
                        decoration: InputDecoration(
                            hintText: "Password",
                            prefixIcon: const Icon(
                              Icons.password_rounded,
                              color: Colors.blue,
                            ),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                                borderSide: const BorderSide(color: Colors.white, width: 1.0)
                            ),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                                borderSide: const BorderSide(color: Colors.white, width: 1.0)
                            ),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30)
                            )
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        //Expanded - Expand child such that it fills available space
                        Expanded(
                          child: Container(),
                        ),
                        // const Text(
                        //   "forgot your password?",
                        //   style: TextStyle(fontSize: 20, color: Colors.grey),
                        // ),
                        // TextButton(
                        //     onPressed: () => Navigator.of(context).push(
                        //         MaterialPageRoute(
                        //             // builder: (context) => ResetPass())),
                        //     child: Text(
                        //       "Forgot Password?",
                        //       style:
                        //       TextStyle(fontSize: 20, color: Colors.grey),
                        //     ))
                      ],
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              GestureDetector(
                onTap: () {
                  signIn();
                },
                child: Container(
                  width: w * 0.5,
                  height: h * 0.07,
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      begin: Alignment.topRight,
                      end: Alignment.bottomLeft,
                      colors: [
                        Colors.blue,
                        Colors.indigo,
                      ],
                    ),
                    borderRadius: BorderRadius.circular(30),
                    //     image: DecorationImage(
                    //       image: AssetImage(
                    //           "img/login.png"
                    //       ),
                    //       fit: BoxFit.cover,
                    //     )
                  ),
                  child: const Center(
                    child: Text(
                      "Sign In",
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: w * 0.03,
              ),
              // Text("OR"),
              // // Divider(),
              SizedBox(
                height: 10,
              ),
              // GestureDetector(
              //   onTap: () {},
              //   child: Container(
              //     width: w * 0.50,
              //     height: h * 0.055,
              //     decoration: BoxDecoration(
              //       // gradient: const LinearGradient(
              //       //   begin: Alignment.topRight,
              //       //   end: Alignment.bottomLeft,
              //       //   colors: [
              //       //     Colors.blue,
              //       //     Colors.indigo,
              //       //   ],
              //       // ),
              //       borderRadius: BorderRadius.circular(32),
              //       //     image: DecorationImage(
              //       //       image: AssetImage(
              //       //           "img/login.png"
              //       //       ),
              //       //       fit: BoxFit.cover,
              //       //     )
              //     ),
              //     // child: Center(
              //     //   child: FloatingActionButton.extended(
              //     //     onPressed: () {
              //     //       AuthController.instance.googleLogin();
              //     //     },
              //     //     icon: Image.asset(
              //     //       'assets/google.png',
              //     //       height: 32,
              //     //       width: 32,
              //     //     ),
              //     //     label: Text("Sign With Google"),
              //     //     backgroundColor: Colors.white,
              //     //     foregroundColor: Colors.black,
              //     //   ),
              //     //
              //     //   // child: Text(
              //     //   //   "Sign In With Google",
              //     //   //   style: TextStyle(
              //     //   //     fontSize: 20,
              //     //   //     fontWeight: FontWeight.bold,
              //     //   //     color: Colors.white,
              //     //   //   ),
              //     //   // ),
              //     // ),
              //   ),
              // ),

              SizedBox(
                height: 30,
              ),
              RichText(
                  text: TextSpan(
                      text: "Don\'t have an account?",
                      style: TextStyle(color: Colors.grey[500], fontSize: 20),
                      children: [
                        TextSpan(
                            text: " Create",
                            style: const TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () => {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => RegistrationScreen()),
                                )
                              })
                      ])),
              SizedBox(
                height: 20,
              )
            ],
          ),
        ));
  }
}

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}
