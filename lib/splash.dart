import 'dart:async';

import 'package:calculator/home.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(
        Duration(seconds: 5),
        () => Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => HomeScreen())));
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 300,
            width: 300,
            child: Lottie.asset("assets/splash.json", fit: BoxFit.cover),
          ),
          const Text(
            "Muhammad ATif Pervaiz",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 40),
          )
        ],
      ),
    );
  }
}
