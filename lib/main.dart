// ignore_for_file: prefer_const_constructors, unused_import

import 'package:digitalcard/Pages/Authentification/enregistrement/Password.dart';
import 'package:digitalcard/Pages/Authentification/enregistrement/form1.dart';
import 'package:digitalcard/Pages/Authentification/enregistrement/form2.dart';
import 'package:digitalcard/Pages/Authentification/logoPage.dart';
import 'package:digitalcard/Pages/Authentification/verification/verification.dart';
import 'package:digitalcard/Pages/home/home.dart';
import 'package:digitalcard/Widgets/form_enregistrement.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

import 'Pages/Authentification/enregistrement/from3.dart';
import 'Pages/Authentification/loadingPage.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Digital Pay',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Digital Pay'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    // return Home();
    return LogoPage();
  }
}
