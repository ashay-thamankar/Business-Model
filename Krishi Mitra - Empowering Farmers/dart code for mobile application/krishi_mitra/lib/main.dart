import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:async';

import 'package:krishi_mitra/home.dart';


void main() {
  runApp(MaterialApp(
    theme: ThemeData(
      primaryColor: Color(0xff99ff33),
      scaffoldBackgroundColor: Color(0xffe6ffcc),
    ),
    debugShowCheckedModeBanner: false,
    home: SplashScreen(),
  ));
}

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(
      seconds: 3),
    (){
      Navigator.push(context, MaterialPageRoute(builder: (context)=>myApp(),),);
    },);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
//          Container(
//            decoration: BoxDecoration(
//              color: Color(0xffbbff99),
//              gradient: LinearGradient(
//                colors: [Color(0xff80ff72),Color(0xff7ee8fa)],
//                begin: Alignment.centerRight,
//                end: Alignment.centerLeft,
//              ),
//            ),
//          ),
          Center(child: Image.asset('images/splash.jpeg')),
        ],
      ),
    );
  }
}




