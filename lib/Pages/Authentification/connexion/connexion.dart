// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, unused_import, unused_local_variable, prefer_is_empty, avoid_print, unused_element, sized_box_for_whitespace

import 'dart:async';
import 'package:digitalcard/Pages/Authentification/presentationPage.dart';
import 'package:digitalcard/Pages/home/home.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

import '../enregistrement/form2.dart';

class Connexion extends StatefulWidget {
  const Connexion({Key? key}) : super(key: key);

  @override
  State<Connexion> createState() => _ConnexionState();
}

class _ConnexionState extends State<Connexion> {
  startTimer() async {
    return loginRoute;
  }

  loginRoute() {
    // Navigator.pushReplacement(
    //     context, MaterialPageRoute(builder: (context) => LoadingPage()));
    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (builder) => PresentationPage()),
        (route) => false);
  }

  bool connexion = false;
  String name = "Stéphane Carlos";
  List<int> firstRow = [1, 2, 3], secRow = [4, 5, 6], thirdRow = [7, 8, 9];
  int pinLength = 4;
  String pinEntrer = "";
  // String exemple = "1122";
  String alertErreur = "";

  numeroClique(int item) {
    pinEntrer = pinEntrer + item.toString();
    if (pinEntrer.length == pinLength) {
      // alertErreur =
      //     (pinEntrer == exemple) ? "Correct" : "PIN incorrect, Réessayer svp ";
      alertErreur = "PIN complet";
      connexion = true;
      startTimer;
      // if (pinEntrer.length > pinLength) {
      //   pinEntrer = pinEntrer;
      //   print(pinEntrer);
      // }
    }
    if (pinEntrer.length > pinLength) {
      alertErreur = "5 chiffres non autorisé, Veuillez recommencer";
      pinEntrer = "";
      connexion = false;
    }
    print(pinEntrer);
    setState(() {});
  }

  retourNumeroArriere() {
    if (pinEntrer.length > 0) {
      pinEntrer = pinEntrer.substring(0, pinEntrer.length - 1);
      alertErreur = "";
      print(pinEntrer);
      setState(() {});
      connexion = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    final TextStyle headline4 = Theme.of(context).textTheme.headline4!;
    final longeur = MediaQuery.of(context).size.height;
    final largeur = MediaQuery.of(context).size.width;
    Widget numberButton(int item) {
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
        child: InkWell(
          onTap: () => numeroClique(item),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(item.toString(),
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
          ),
        ),
      );
    }

    return Scaffold(
      backgroundColor: Color(0xFFe7edeb),
      body: SingleChildScrollView(
        child: Container(
          constraints: BoxConstraints(maxHeight: longeur, maxWidth: largeur),
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(top: 50, left: 20, right: 20),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    connexion
                        ? Text("")
                        : InkWell(
                            onTap: () {
                              Navigator.of(context).push(PageRouteBuilder(
                                  transitionDuration: Duration(seconds: 1),
                                  transitionsBuilder: (context, animation,
                                      anotherAnimation, child) {
                                    animation = CurvedAnimation(
                                        curve: Curves.easeIn,
                                        parent: animation);
                                    return SlideTransition(
                                      position: Tween(
                                              begin: Offset(1.0, 0.0),
                                              end: Offset(0.0, 0.0))
                                          .animate(animation),
                                      child: child,
                                    );
                                  },
                                  pageBuilder: (BuildContext context,
                                      Animation<double> animation,
                                      Animation<double> secondaryAnimation) {
                                    return PresentationPage();
                                  }));
                            },
                            child: Row(
                              children: [
                                Icon(
                                  Icons.arrow_back_ios_new,
                                  color: Color(0xffe2b80e),
                                  size: 20,
                                ),
                                Text(
                                  "Déconnexion",
                                  style: GoogleFonts.aBeeZee(
                                      textStyle: headline4,
                                      fontSize: 20,
                                      fontWeight: FontWeight.w500,
                                      color: Color(0xffe2b80e)),
                                ),
                              ],
                            ),
                          ),
                    // InkWell(
                    //     onTap: () {
                    //       Navigator.of(context).push(MaterialPageRoute(
                    //           builder: (context) => PresentationPage()));
                    //     },
                    //     child: Icon(
                    //       Icons.arrow_back_ios_rounded,
                    //       color: Color(0xffe2b80e),
                    //       size: 30,
                    //     )),
                    connexion
                        ? InkWell(
                            onTap: () {
                              Navigator.pushAndRemoveUntil(
                                  context,
                                  MaterialPageRoute(
                                      builder: (builder) => Home()),
                                  (route) => false);
                            },
                            // onTap: () {
                            //   Navigator.of(context).push(PageRouteBuilder(
                            //       transitionDuration: Duration(seconds: 1),
                            //       transitionsBuilder: (context, animation,
                            //           anotherAnimation, child) {
                            //         animation = CurvedAnimation(
                            //             curve: Curves.easeIn,
                            //             parent: animation);
                            //         return SlideTransition(
                            //           position: Tween(
                            //                   begin: Offset(1.0, 0.0),
                            //                   end: Offset(0.0, 0.0))
                            //               .animate(animation),
                            //           child: child,
                            //         );
                            //       },
                            //       pageBuilder: (BuildContext context,
                            //           Animation<double> animation,
                            //           Animation<double> secondaryAnimation) {
                            //         return Home();
                            //       }));
                            // },
                            child: Row(
                              children: [
                                Text(
                                  "Connexion",
                                  style: GoogleFonts.aBeeZee(
                                      textStyle: headline4,
                                      fontSize: 20,
                                      fontWeight: FontWeight.w500,
                                      color: Color(0xffe2b80e)),
                                ),
                                Icon(
                                  Icons.arrow_forward_ios_sharp,
                                  color: Color(0xffe2b80e),
                                  size: 20,
                                ),
                              ],
                            ),
                          )
                        : Text(" ")
                  ],
                ),
              ),
              Container(
                height: 150,
                child: Lottie.asset(
                  'assets/login.json',
                  repeat: true,
                ),
              ),
              Container(
                child: Padding(
                    padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
                    child: Column(
                      children: [
                        Container(
                          margin: EdgeInsets.only(top: 50, left: 20, right: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                (pinEntrer.length >= 1)
                                    ? Icons.circle
                                    : Icons.circle_outlined,
                                size: 30,
                                color: Color(0xffe2b80e),
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Icon(
                                (pinEntrer.length >= 2)
                                    ? Icons.circle
                                    : Icons.circle_outlined,
                                size: 30,
                                color: Color(0xffe2b80e),
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Icon(
                                (pinEntrer.length >= 3)
                                    ? Icons.circle
                                    : Icons.circle_outlined,
                                size: 30,
                                color: Color(0xffe2b80e),
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Icon(
                                (pinEntrer.length == 4)
                                    ? Icons.circle
                                    : Icons.circle_outlined,
                                size: 30,
                                color: Color(0xffe2b80e),
                              ),
                            ],
                          ),
                        ),
                      ],
                    )),
              ),
              Text(
                alertErreur,
                style: TextStyle(
                    color: (pinEntrer.length == pinLength)
                        ? Colors.green
                        : Colors.red),
              ),
              SizedBox(
                height: 7,
              ),
              Container(
                margin: EdgeInsets.only(top: 5, left: 15, right: 15),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(40),
                ),
                // width: double.infinity,
                // decoration: BoxDecoration(
                //     color: Colors.grey[100],
                //     borderRadius: BorderRadius.only(
                //         topLeft: Radius.circular(40),
                //         topRight: Radius.circular(40))),
                child: Padding(
                    padding: const EdgeInsets.fromLTRB(20, 10, 20, 20),
                    child: Column(
                      children: [
                        Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children:
                                firstRow.map((e) => numberButton(e)).toList()),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children:
                                secRow.map((e) => numberButton(e)).toList()),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children:
                                thirdRow.map((e) => numberButton(e)).toList()),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              IconButton(
                                  onPressed: () {},
                                  icon: Icon(Icons.fingerprint)),
                              numberButton(0),
                              IconButton(
                                  onPressed: () => retourNumeroArriere(),
                                  icon: Icon(Icons.backspace_outlined))
                            ]),
                      ],
                    )),
              ),
              Container(
                margin: EdgeInsets.only(top: 10),
                alignment: Alignment.bottomCenter,
                child: Container(
                  height: 60,
                  width: 130,
                  child: Padding(
                    padding: EdgeInsets.only(bottom: 5),
                    child: Image.asset(
                      "assets/DFblack.png",
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
