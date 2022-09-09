// ignore_for_file: file_names, avoid_unnecessary_containers, prefer_const_literals_to_create_immutables, prefer_const_constructors, sized_box_for_whitespace
import 'package:digitalcard/Pages/Authentification/connexion/connexion.dart';
import 'package:digitalcard/Pages/Authentification/enregistrement/form1.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:google_fonts/google_fonts.dart';

class PresentationPage extends StatefulWidget {
  const PresentationPage({Key? key}) : super(key: key);

  @override
  State<PresentationPage> createState() => _PresentationPageState();
}

class _PresentationPageState extends State<PresentationPage> {
  @override
  Widget build(BuildContext context) {
    final TextStyle headline4 = Theme.of(context).textTheme.headline4!;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          alignment: Alignment.center,
          child: Column(
            children: [
              Container(
                // margin: EdgeInsets.only(top: 10),
                child: Lottie.asset(
                  'assets/presentation.json',
                  repeat: true,
                ),
              ),
              Container(
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(40),
                  ),
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 50, vertical: 5),
                    child: (Column(
                      // mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          child: Text(
                            "Bienvenue",
                            style: GoogleFonts.aBeeZee(
                              textStyle: headline4,
                              fontSize: 30,
                              fontWeight: FontWeight.w600,
                              color: Color(0xffe2b80e),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                            margin: EdgeInsets.symmetric(horizontal: 20),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Dépôt - Retrait",
                                  style: TextStyle(
                                    fontSize: 22,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                Text(
                                  "Paiement marchant",
                                  style: TextStyle(
                                    fontSize: 22,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                Text(
                                  "Achat en ligne ",
                                  style: TextStyle(
                                    fontSize: 22,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                Text(
                                  "Achat carte ",
                                  style: TextStyle(
                                    fontSize: 22,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  "GRATUIT...",
                                  style: GoogleFonts.aBeeZee(
                                    textStyle: headline4,
                                    fontSize: 22,
                                    fontWeight: FontWeight.w500,
                                    color: Color(0xffe2b80e),
                                  ),
                                ),
                                // SizedBox(
                                //   height: 15,
                                // ),
                              ],
                            ))
                      ],
                    )),
                  )),
              Column(
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.of(context).push(PageRouteBuilder(
                          transitionDuration: Duration(seconds: 1),
                          transitionsBuilder:
                              (context, animation, anotherAnimation, child) {
                            animation = CurvedAnimation(
                                curve: Curves.decelerate, parent: animation);
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
                            return Connexion();
                          }));
                    },
                    child: Container(
                      margin: EdgeInsets.only(
                        left: 30,
                        right: 30,
                        top: 20,
                      ),
                      height: 54,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        border: Border.all(
                            width: 1,
                            color: Colors.black,
                            style: BorderStyle.solid),
                        // color: Color(0xffe2b80e),
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Text(
                        "Je me connecte",
                        style: TextStyle(
                            color: Color(0xffe2b80e),
                            fontWeight: FontWeight.bold,
                            fontSize: 20),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.of(context).push(PageRouteBuilder(
                          transitionDuration: Duration(seconds: 1),
                          transitionsBuilder:
                              (context, animation, anotherAnimation, child) {
                            animation = CurvedAnimation(
                                curve: Curves.decelerate, parent: animation);
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
                            return Form1();
                          }));
                    },
                    child: Container(
                      margin: EdgeInsets.only(
                        left: 30,
                        right: 30,
                        top: 20,
                      ),
                      height: 54,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: Color(0xffe2b80e),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Text(
                        "Je crée un nouveau compte",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 20),
                      ),
                    ),
                  ),
                ],
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
            ],
          ),
        ),
      ),
    );
  }
}
