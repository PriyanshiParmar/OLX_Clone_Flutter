import 'package:ecommerce/ui/user_form.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'package:ecommerce/ui/login_screen.dart';
// import 'package:ecommerce/ui/user_form.dart';
// import 'package:ecommerce/const/AppColors.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';

// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:fluttertoast/fluttertoast.dart';
//
// class RegistrationScreen extends StatefulWidget {
//   @override
//   _RegistrationScreenState createState() => _RegistrationScreenState();
// }
//
// class _RegistrationScreenState extends State<RegistrationScreen> {
//   //TextEditingController - Controller for editable text field
//   TextEditingController _emailController = TextEditingController();
//   TextEditingController _passwordController = TextEditingController();
//   bool _obscureText = true;
//
//   signUp()async{    //Asynchronous function
//     try {
//       //Using firebase authentication
//       //FirebaseAuth.instance - Creates an instance of FirebaseAuth
//       //createUserWithEmailAndPassword - create new user with specified email and password
//       UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
//           email: _emailController.text,
//           password: _passwordController.text
//       );
//       var authCredential = userCredential.user;
//       print(authCredential!.uid);
//       if(authCredential.uid.isNotEmpty){        //If uid is not empty(user created) go to UserForm
//         //Navigator - transition from one page to other
//         //            Maintains a stack
//         //Navigator.push - Adds route to stack of routes managed by navigator
//         //CupertinoPageRoute - Replace entire screen with an iOS transition
//         Navigator.push(context, CupertinoPageRoute(builder: (_)=>UserForm()));
//       }
//       else{
//         //Fluttertoast - shows specified message at bottom of device screen
//         Fluttertoast.showToast(msg: "Something is wrong");
//       }
//
//     } on FirebaseAuthException catch (e) {
//       if (e.code == 'weak-password') {
//         Fluttertoast.showToast(msg: "The password provided is too weak.");
//
//       } else if (e.code == 'email-already-in-use') {
//         Fluttertoast.showToast(msg: "The account already exists for that email.");
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
//       body: SafeArea(     //Places child in such a way that avoid intrusions by os
//         child: Column(
//           children: [
//             SizedBox(     //Creates a child element of specified width and height
//               height: 150.h,
//               width: ScreenUtil().screenWidth,
//               child: Padding(
//                 padding: EdgeInsets.only(left: 20.w),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   mainAxisAlignment: MainAxisAlignment.start,
//                   children: [
//                     IconButton(
//                       onPressed: null,
//                       icon: Icon(
//                         Icons.light,
//                         color: Colors.transparent,
//                       ),
//                     ),
//                     Text(
//                       "Sign Up",
//                       style: TextStyle(fontSize: 22.sp, color: Colors.white),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//             Expanded(
//               child: Container(
//                 width: ScreenUtil().screenWidth,
//                 decoration: BoxDecoration(
//                   color: Colors.white,
//                   borderRadius: BorderRadius.only(
//                     topLeft: Radius.circular(28.r),
//                     topRight: Radius.circular(28.r),
//                   ),
//                 ),
//                 child: Padding(
//                   padding: EdgeInsets.all(20.w),
//                   child: SingleChildScrollView(       //A box in which only single widget can be scrolled
//                     scrollDirection: Axis.vertical,
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         SizedBox(
//                           height: 20.h,
//                         ),
//                         Text(
//                           "Welcome Buddy!",
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
//                         SizedBox(
//                           height: 15.h,
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
//                                   Icons.email_outlined,
//                                   color: Colors.white,
//                                   size: 20.w,
//                                 ),
//                               ),
//                             ),
//                             SizedBox(
//                               width: 10.w,
//                             ),
//                             Expanded(
//                               child: TextField(
//                                 controller: _emailController,
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
//                         SizedBox(
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
//                             SizedBox(
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
//                         SizedBox(
//                           height: 50.h,
//                         ),
//                         // elevated button
//                         SizedBox(
//                           width: 1.sw,
//                           height: 56.h,
//                           child: ElevatedButton(
//                             onPressed: () {
//                               signUp();
//                             },
//                             child: Text(
//                               "Continue",
//                               style: TextStyle(
//                                   color: Colors.white, fontSize: 18.sp),
//                             ),
//                             style: ElevatedButton.styleFrom(
//                               primary: AppColors.deep_orange,
//                               elevation: 3,
//                             ),
//                           ),
//                         ),
//                         SizedBox(
//                           height: 20.h,
//                         ),
//                         Wrap(
//                           children: [
//                             Text(
//                               "Don't have an account?",
//                               style: TextStyle(
//                                 fontSize: 13.sp,
//                                 fontWeight: FontWeight.w600,
//                                 color: Color(0xFFBBBBBB),
//                               ),
//                             ),
//                             GestureDetector(
//                               child: Text(
//                                 " Sign In",
//                                 style: TextStyle(
//                                   fontSize: 13.sp,
//                                   fontWeight: FontWeight.w600,
//                                   color: AppColors.deep_orange,
//                                 ),
//                               ),
//                               onTap: () {
//                                 Navigator.push(
//                                     context,
//                                     CupertinoPageRoute(
//                                         builder: (context) => LoginPage()));
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



import 'package:fluttertoast/fluttertoast.dart';

class RegistrationScreen extends StatefulWidget {
  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  //TextEditingController - Controller for editable text field
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  bool _obscureText = true;

  signUp()async{    //Asynchronous function
    try {
      //Using firebase authentication
      //FirebaseAuth.instance - Creates an instance of FirebaseAuth
      //createUserWithEmailAndPassword - create new user with specified email and password
      UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: _emailController.text,
          password: _passwordController.text
      );
      var authCredential = userCredential.user;
      print(authCredential!.uid);
      if(authCredential.uid.isNotEmpty){        //If uid is not empty(user created) go to UserForm
        //Navigator - transition from one page to other
        //            Maintains a stack
        //Navigator.push - Adds route to stack of routes managed by navigator
        //CupertinoPageRoute - Replace entire screen with an iOS transition
        Navigator.push(context, CupertinoPageRoute(builder: (_)=>UserForm()));
      }
      else{
        //Fluttertoast - shows specified message at bottom of device screen
        Fluttertoast.showToast(msg: "Something is wrong");
      }

    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        Fluttertoast.showToast(msg: "The password provided is too weak.");

      } else if (e.code == 'email-already-in-use') {
        Fluttertoast.showToast(msg: "The account already exists for that email.");

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
          title: Text('SignUp'),
          centerTitle: true,
          // centerTitle: true,
          // automaticallyImplyLeading: false,
          // actions: <Widget>[
          //   IconButton(
          //     icon: const Icon(Icons.arrow_back),
          //     tooltip: 'Login',
          //     onPressed: () {
          //       Navigator.pop(context);
          //     },
          //   ),
          // ],
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
                height: h * 0.40,
                margin: EdgeInsets.only(top: 30),
                decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/signUp.png"),
                      fit: BoxFit.cover,
                    )),
              ),
              Container(
                width: w,
                margin: const EdgeInsets.only(left: 20, right: 20, top: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 0),
                    const Center(
                      child: Text(
                        "Register your account",
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    // const Text(
                    //   "Register your account",
                    //   style: TextStyle(fontSize: 20, color: Colors.grey),
                    // ),
                    // const SizedBox(height: 25),
                    // Container(
                    //   decoration: BoxDecoration(
                    //       color: Colors.white,
                    //       borderRadius: BorderRadius.circular(30),
                    //       boxShadow: [
                    //         BoxShadow(
                    //             blurRadius: 10,
                    //             spreadRadius: 7,
                    //             offset: const Offset(1, 1),
                    //             color: Colors.grey.withOpacity(0.2))
                    //       ]),
                    //   child: TextField(
                    //     controller: userController,
                    //     decoration: InputDecoration(
                    //         hintText: "Username",
                    //         prefixIcon: const Icon(
                    //           Icons.supervised_user_circle,
                    //           color: Colors.deepPurple,
                    //         ),
                    //         focusedBorder: OutlineInputBorder(
                    //             borderRadius: BorderRadius.circular(30),
                    //             borderSide: const BorderSide(
                    //                 color: Colors.white, width: 1.0)),
                    //         enabledBorder: OutlineInputBorder(
                    //             borderRadius: BorderRadius.circular(30),
                    //             borderSide: const BorderSide(
                    //                 color: Colors.white, width: 1.0)),
                    //         border: OutlineInputBorder(
                    //             borderRadius: BorderRadius.circular(30))),
                    //   ),
                    // ),
                    const SizedBox(height: 30),
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
                    // const SizedBox(height: 15),
                    // Row(
                    //   children: [
                    //     Expanded(
                    //       child: Container(),
                    //     ),
                    //     const Text(
                    //       "forgot your password?",
                    //       style: TextStyle(fontSize: 20, color: Colors.grey),
                    //     ),
                    //   ],
                    // )
                  ],
                ),
              ),
              SizedBox(
                height: w * 0.1,
              ),
              GestureDetector(
                onTap: () {
                  print("inside signup");
                  signUp();
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
                      "Sign Up",
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
                height: w * 0.05,
              ),
              // RichText(
              //     text: TextSpan(
              //         recognizer: TapGestureRecognizer()
              //           ..onTap = () => Get.back(),
              //         text: "Already Have an account?",
              //
              //
              //         style: TextStyle(
              //           fontWeight: FontWeight.bold,
              //           fontSize: 20,
              //           color: Colors.black,
              //         )),
              //
              // )

              RichText(
                  text: TextSpan(
                      text: "Already Have an Account?",
                      style: TextStyle(color: Colors.grey[500], fontSize: 20),
                      children: [
                        TextSpan(
                            text: " Login",
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
                                      builder: (context) => const LoginPage()),
                                )
                              })
                      ])),

              // SizedBox(
              //   height: w * 0.06,
              // ),
              // RichText(
              //     text: TextSpan(
              //         text: "Don\'t have an account?",
              //         style: TextStyle(color: Colors.grey[500], fontSize: 20),
              //         ))
            ],
          ),
        ));
  }
}