import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';

import '../../const/AppColors.dart';
import '../../widgets/customButton.dart';
import '../../widgets/myTextField.dart';
import '../bottom_nav_controller.dart';
// import 'bottom_nav_pages/home.dart';


class Sell extends StatefulWidget {
  @override
  _SellScreen createState() => _SellScreen();
}
class _SellScreen extends State<Sell> {
  /// Variables
  // File? imageFile;
  TextEditingController _prdNameController = TextEditingController();
  TextEditingController _prdDescController = TextEditingController();
  TextEditingController _prdPriceController = TextEditingController();
  List<File> imageFiles = [] ;
  List<String> img_urls = [];

  // uploadToCloud() async{
  //   // Create a storage reference from our app
  //   //FirebaseStorage storage = FirebaseStorage.instance;
  //
  // }

  addToDatabase() async{
    if(imageFiles.isEmpty){
      Fluttertoast.showToast(msg: "Add atleast one image.");
      print("Add atleast one image");
      return;
    }
    else{
      final storageRef = FirebaseStorage.instance.ref();

      DateTime now = DateTime.now();
      // final imgRef = storageRef.child("product-images/$now-img.jpg");
      final prdName = _prdNameController.text;

      try {
        for (int i = 0; i < imageFiles.length; i++) {
          final imgRef = storageRef.child("product-images/$prdName-$i.jpg");
          await imgRef.putFile(imageFiles[i]);
          var dowurl = await imgRef.getDownloadURL();
          var url = dowurl.toString();
          img_urls.add(url);
          print(imgRef);
        }
      } on FirebaseException catch (e) {
        print("Error $e");
      }
      // Add a new document with a generated id.
      final data = {
        "product-name": _prdNameController.text,
        "product-description": _prdDescController.text,
        "product-price": _prdPriceController.text,
        "product-img": img_urls
      };
      final db = FirebaseFirestore.instance;
      db.collection("products").add(data).then(
          (DocumentReference doc) => print("Added Data with ID: ${doc.id}"));
      Navigator.push(
          context, MaterialPageRoute(builder: (_) => BottomNavController()));
    }
  }


  /// Widget
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Image Picker"),
        ),
        body: SafeArea(
          child: Container(
              child: Container(
                alignment: Alignment.center,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "Submit the form to continue.",
                      style:
                      TextStyle(fontSize: 22.sp, color: AppColors.deep_orange),
                    ),
                    SizedBox(
                      height: 15.h,
                    ),
                    myTextField("Product-name",TextInputType.text,_prdNameController),
                    myTextField("Product-description",TextInputType.text,_prdDescController),
                    myTextField("Product-price",TextInputType.number,_prdPriceController),
                    // customButton("Add image",()=>uploadToCloud()),

                    ElevatedButton(
                      //color: Colors.greenAccent,
                      onPressed: () {
                        _getFromGallery();
                      },
                      child: Text("Add image from gallery"),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    ElevatedButton(
                      //color: Colors.lightGreenAccent,
                      onPressed: () {
                        _getFromCamera();
                      },
                      child: Text("Add image from camera"),
                    ),
                    customButton("Continue",()=>addToDatabase()),
                  ],
                ),
    )
    ),
        ));
  }

  /// Get from gallery
  _getFromGallery() async {
    PickedFile? pickedFile = await ImagePicker().getImage(
      source: ImageSource.gallery,
      maxWidth: 1800,
      maxHeight: 1800,
    );
    if (pickedFile != null) {
      setState(() {
        imageFiles.add(File(pickedFile.path));
        // imageFile = File(pickedFile.path);
      });
      // uploadToCloud();
    }
  }

  /// Get from Camera
  _getFromCamera() async{
    PickedFile? pickedFile = await ImagePicker().getImage(
      source: ImageSource.camera,
      maxWidth: 1800,
      maxHeight: 1800,
    );
    if (pickedFile != null) {
      setState(() {
        imageFiles.add(File(pickedFile.path));
        // imageFile = File(pickedFile.path);
      });
      // uploadToCloud();
    }
  }
}
