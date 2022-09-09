// ignore_for_file: file_names, prefer_const_constructors, avoid_unnecessary_containers, sized_box_for_whitespace, unused_import

import 'dart:async';

import 'package:digitalcard/Pages/Authentification/presentationPage.dart';
import 'package:digitalcard/Pages/home/home.dart';
import 'package:flutter/material.dart';
// import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class LoadingPage extends StatefulWidget {
  const LoadingPage({Key? key}) : super(key: key);

  @override
  State<LoadingPage> createState() => _LoadingPageState();
}

class _LoadingPageState extends State<LoadingPage> {
  @override
  void initState() {
    super.initState();
    startTimer();
  }

  startTimer() async {
    var duration = Duration(seconds: 4);
    return Timer(duration, loginRoute);
  }

  loginRoute() {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => PresentationPage()));
    // Get.to(() => Home(), transition: Transition.cupertino);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      color: Colors.white,
      child: Stack(
        children: [
          Center(
            child: Container(
              height: 120,
              // child: Lottie.network(
              //   'https://assets4.lottiefiles.com/packages/lf20_0llypvqx.json',
              // ),
              child: Lottie.asset('assets/circle.json', repeat: true),
            ),
          ),
          Container(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 80,
              width: 130,
              child: Padding(
                padding: EdgeInsets.only(bottom: 30),
                child: Image.asset(
                  "assets/DFblack.png",
                ),
              ),
            ),
          ),
        ],
      ),
    ));
  }
}
