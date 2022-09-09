// ignore_for_file: camel_case_types, prefer_const_constructors, avoid_unnecessary_containers, file_names, unused_import

import 'dart:async';

import 'package:digitalcard/Pages/Authentification/loadingPage.dart';
import 'package:digitalcard/Pages/Authentification/presentationPage.dart';
import 'package:flutter/material.dart';

class LogoPage extends StatefulWidget {
  const LogoPage({Key? key}) : super(key: key);

  @override
  State<LogoPage> createState() => _LogoPageState();
}

class _LogoPageState extends State<LogoPage> {
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
    // Navigator.pushReplacement(
    //     context, MaterialPageRoute(builder: (context) => LoadingPage()));
    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (builder) => LoadingPage()),
        (route) => false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        child: Image.asset("assets/logoDF.png", height: 200),
      ),
    );
  }
}
