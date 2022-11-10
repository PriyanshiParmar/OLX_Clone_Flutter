import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce/const/AppColors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../product_details_screen.dart';
import '../search_screen.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<String> _carouselImages = [];
  var _dotPosition = 0;
  List _products = [];
  var _firestoreInstance = FirebaseFirestore.instance;    //Create an instance of firestoreInstance

  fetchCarouselImages() async {
    //QuerySnapshot - store result of query , contain document snapshot
    QuerySnapshot qn =
    await _firestoreInstance.collection("carousel-slider").get();     //Get data of carousel-slider collection
    setState(() {
      for (int i = 0; i < qn.docs.length; i++) {
        _carouselImages.add(    //Add image path in collection to variable
          qn.docs[i]["img-path"],
        );
        print(qn.docs[i]["img-path"]);
      }
    });

    return qn.docs;
  }

  fetchProducts() async {
    QuerySnapshot qn = await _firestoreInstance.collection("products").get();   //Get data of products collection
    setState(() {
      for (int i = 0; i < qn.docs.length; i++) {
        _products.add({         //Add product details from collection to variable
          "product-name": qn.docs[i]["product-name"],
          "product-description": qn.docs[i]["product-description"],
          "product-price": qn.docs[i]["product-price"],
          "product-img": qn.docs[i]["product-img"],
        });
      }
    });

    return qn.docs;
  }

  @override
  void initState() {
    //When this widget object is created, before starting perform below tasks
    fetchCarouselImages();
    fetchProducts();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Container(
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 20.w, right: 20.w),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      readOnly: true,
                      decoration: InputDecoration(    //Used to decorate text field
                        fillColor: Colors.white,
                        //focusedBorder - border to be displayed when InputDecorator has focus
                        //OutlineInputBorder - draws a rounded rectangle around InputDecorator
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(0)),
                            borderSide: BorderSide(color: Colors.blue)),
                        //enabledBorder - border to be displayed when InputDecorator is enabled
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(0)),
                            borderSide: BorderSide(color: Colors.grey)),
                        hintText: "Search products here",
                        hintStyle: TextStyle(fontSize: 15.sp),
                      ),
                      //When tapped on textFormField - navigate to SearchScreen()
                      onTap: () => Navigator.push(context,
                          CupertinoPageRoute(builder: (_) => SearchScreen())),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),
                //AspectRatio - Attempts to size child according aspectRatio
                AspectRatio(
                  aspectRatio: 2.5, //width:height ratio
                  child: CarouselSlider(
                      items: _carouselImages
                          .map((item) => Padding(
                        padding: const EdgeInsets.only(left: 5, right: 5),
                        child: Container(
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: NetworkImage(item),
                                  fit: BoxFit.fitWidth)),
                        ),
                      ))
                          .toList(),
                      options: CarouselOptions(
                          autoPlay: false,
                          enlargeCenterPage: true,
                          viewportFraction: 0.8,
                          enlargeStrategy: CenterPageEnlargeStrategy.height,
                          onPageChanged: (val, carouselPageChangedReason) {
                            setState(() {
                              _dotPosition = val;
                            });
                          })),
                ),
                SizedBox(
                  height: 10.h,
                ),
                DotsIndicator(
                  dotsCount:
                  _carouselImages.length == 0 ? 1 : _carouselImages.length,
                  position: _dotPosition.toDouble(),
                  decorator: DotsDecorator(
                    activeColor: AppColors.deep_orange,
                    color: AppColors.deep_orange.withOpacity(0.5),
                    spacing: EdgeInsets.all(2),
                    activeSize: Size(8, 8),
                    size: Size(6, 6),
                  ),
                ),
                SizedBox(
                  height: 15.h,
                ),
                Expanded(
                  child: GridView.builder(
                      scrollDirection: Axis.vertical,
                      itemCount: _products.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2, childAspectRatio: 1),
                      itemBuilder: (_, index) {
                        return GestureDetector(
                          onTap: ()=>Navigator.push(context, MaterialPageRoute(builder: (_)=>ProductDetails(_products[index]))),
                          child: Card(
                            elevation: 3,
                            child: Column(
                              children: [
                                AspectRatio(
                                    aspectRatio: 2,
                                    child: Container(
                                        color: Colors.white,
                                        child: Image.network(
                                          _products[index]["product-img"][0],
                                        ))),
                                Text("${_products[index]["product-name"]}"),
                                Text(
                                    "${_products[index]["product-price"].toString()}"),
                              ],
                            ),
                          ),
                        );
                      }),
                ),
              ],
            ),
          )),
    );
  }
}
