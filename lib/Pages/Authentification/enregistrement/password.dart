// ignore_for_file: prefer_const_constructors, file_names, unused_local_variable, prefer_const_literals_to_create_immutables, sized_box_for_whitespace, avoid_unnecessary_containers, camel_case_types, unused_element, avoid_print, prefer_is_empty, unused_import

import 'dart:async';

import 'package:digitalcard/Pages/Authentification/presentationPage.dart';
import 'package:digitalcard/Pages/home/home.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CreatePassword extends StatefulWidget {
  const CreatePassword({Key? key}) : super(key: key);

  @override
  State<CreatePassword> createState() => _CreatePasswordState();
}

class _CreatePasswordState extends State<CreatePassword> {
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
      startTimer;
      // if (pinEntrer.length > pinLength) {
      //   pinEntrer = pinEntrer;
      //   print(pinEntrer);
      // }
    }
    if (pinEntrer.length > pinLength) {
      alertErreur = "5 chiffres non autorisé, Veuillez recommencer";
      pinEntrer = "";
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
    }
  }

  @override
  Widget build(BuildContext context) {
    final TextStyle headline4 = Theme.of(context).textTheme.headline4!;

    final longeur = MediaQuery.of(context).size.height;
    final largeur = MediaQuery.of(context).size.width;

    Widget username() {
      return RichText(
          text: TextSpan(children: [
        TextSpan(
          text: " $name",
          style: GoogleFonts.aBeeZee(
              textStyle: headline4,
              fontSize: 17,
              fontWeight: FontWeight.w800,
              color: Colors.black),
        )
      ]));
    }

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
      body: GestureDetector(
        onTap: (() => FocusScope.of(context).requestFocus(FocusNode())),
        child: SingleChildScrollView(
            child: Container(
          constraints: BoxConstraints(maxHeight: longeur, maxWidth: largeur),
          decoration: BoxDecoration(
            // image: DecorationImage(
            //     opacity: 0.3,
            //     image: AssetImage(
            //       "assets/group2.jpg",
            //     ),
            //     fit: BoxFit.cover),
            gradient: LinearGradient(
              colors: [
                Color(0xffe2b80e),
                Colors.black87,
              ],
              begin: Alignment.topCenter,
              end: Alignment.center,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 1,
                child: Container(
                  margin: EdgeInsets.only(top: 50, left: 20, right: 20),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.of(context).push(PageRouteBuilder(
                              transitionDuration: Duration(seconds: 1),
                              transitionsBuilder: (context, animation,
                                  anotherAnimation, child) {
                                animation = CurvedAnimation(
                                    curve: Curves.easeIn, parent: animation);
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
                                return Home();
                              }));
                        },
                        child: Row(
                          children: [
                            Text(
                              "Connexion",
                              style: GoogleFonts.aBeeZee(
                                  textStyle: headline4,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white),
                            ),
                            Icon(
                              Icons.arrow_forward_ios_sharp,
                              color: Colors.white,
                              size: 20,
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 6,
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: Colors.grey[100],
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(40),
                          topRight: Radius.circular(40))),
                  child: Column(children: [
                    Padding(
                      padding: EdgeInsets.all(24.0),
                      child: Column(
                        children: [
                          Container(
                            alignment: Alignment.topCenter,
                            child: Column(
                              children: [
                                Text(
                                  "Création de code Pin",
                                  style: GoogleFonts.aBeeZee(
                                    textStyle: headline4,
                                    fontSize: 22,
                                    fontWeight: FontWeight.w500,
                                    color: Color(0xffe2b80e),
                                  ),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Container(
                                  width: largeur - 20,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            "Bravo ",
                                            textAlign: TextAlign.center,
                                            style: GoogleFonts.aBeeZee(
                                              textStyle: headline4,
                                              fontSize: 17,
                                              fontWeight: FontWeight.w200,
                                              color: Colors.grey,
                                            ),
                                          ),
                                          username(),
                                          Text(
                                            "! ",
                                            textAlign: TextAlign.center,
                                            style: GoogleFonts.aBeeZee(
                                              textStyle: headline4,
                                              fontSize: 17,
                                              fontWeight: FontWeight.w200,
                                              color: Colors.grey,
                                            ),
                                          ),
                                        ],
                                      ),
                                      Text(
                                        " votre compte a été crée",
                                        textAlign: TextAlign.center,
                                        style: GoogleFonts.aBeeZee(
                                          textStyle: headline4,
                                          fontSize: 17,
                                          fontWeight: FontWeight.w200,
                                          color: Colors.grey,
                                        ),
                                      ),
                                      Text(
                                        "Veuillez saisir votre code PIN de connexion",
                                        textAlign: TextAlign.center,
                                        style: GoogleFonts.aBeeZee(
                                          textStyle: headline4,
                                          fontSize: 17,
                                          fontWeight: FontWeight.w200,
                                          color: Colors.grey,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                // SizedBox(
                                //   height: longeur * 0.02,
                                // ),
                                Container(
                                  child: Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          20, 25, 20, 20),
                                      child: Column(
                                        children: [
                                          Container(
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
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
                                Container(
                                  margin: EdgeInsets.only(top: 30),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          20, 25, 20, 20),
                                      child: Column(
                                        children: [
                                          Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceAround,
                                              children: firstRow
                                                  .map((e) => numberButton(e))
                                                  .toList()),
                                          Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceAround,
                                              children: secRow
                                                  .map((e) => numberButton(e))
                                                  .toList()),
                                          Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceAround,
                                              children: thirdRow
                                                  .map((e) => numberButton(e))
                                                  .toList()),
                                          Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceAround,
                                              children: [
                                                IconButton(
                                                    onPressed: () {},
                                                    icon: Icon(
                                                        Icons.fingerprint)),
                                                numberButton(0),
                                                IconButton(
                                                    onPressed: () =>
                                                        retourNumeroArriere(),
                                                    icon: Icon(Icons
                                                        .backspace_outlined))
                                              ]),
                                        ],
                                      )),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                        height: 80,
                        width: 130,
                        child: Padding(
                          padding: EdgeInsets.only(bottom: 5),
                          child: Image.asset(
                            "assets/DFblack.png",
                          ),
                        ),
                      ),
                    ),
                  ]),
                ),
              ),
            ],
          ),
        )),
      ),
    );
  }
}
