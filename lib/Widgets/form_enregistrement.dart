// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, avoid_unnecessary_containers, sized_box_for_whitespace, prefer_typing_uninitialized_variables, non_constant_identifier_names, unused_import

import 'package:digitalcard/Pages/Authentification/presentationPage.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';

class FormEnregistrement extends StatelessWidget {
  const FormEnregistrement(
      {Key? key,
      required this.bouton_retour,
      required this.Champ1_name,
      required this.Champ2_name,
      required this.Champ3_name,
      required this.Champ4_name,
      required this.Champ_principal1,
      required this.Champ_principal2,
      required this.Champ_principal3,
      required this.Champ_principal4,
      required this.page_suivante,
      required this.page_precedente})
      : super(key: key);
  final IconData bouton_retour;
  final String Champ1_name;
  final String Champ2_name;
  final String Champ3_name;
  final String Champ4_name;
  final Widget Champ_principal1;
  final Widget Champ_principal2;
  final Widget Champ_principal3;
  final Widget Champ_principal4;
  final Widget page_suivante;
  final Widget page_precedente;
  // final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final TextStyle headline4 = Theme.of(context).textTheme.headline4!;
    return Scaffold(
        body: GestureDetector(
      onTap: (() => FocusScope.of(context).requestFocus(FocusNode())),
      child: Container(
        constraints: BoxConstraints(
            maxHeight: MediaQuery.of(context).size.height,
            maxWidth: MediaQuery.of(context).size.width),
        decoration: BoxDecoration(
          image: DecorationImage(
              opacity: 0.3,
              image: AssetImage(
                "assets/group2.jpg",
              ),
              fit: BoxFit.cover),
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
              flex: 2,
              child: Container(
                margin: EdgeInsets.only(top: 50, left: 20, right: 20),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => page_precedente));
                        },
                        child: Icon(
                          bouton_retour,
                          color: Colors.white,
                          size: 30,
                        )),
                    InkWell(
                      onTap: () {
                        Navigator.of(context).push(PageRouteBuilder(
                            transitionDuration: Duration(seconds: 1),
                            transitionsBuilder:
                                (context, animation, anotherAnimation, child) {
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
                              return page_suivante;
                            }));
                      },
                      child: Row(
                        children: [
                          Text(
                            "SUIVANT",
                            style: GoogleFonts.aBeeZee(
                                textStyle: headline4,
                                fontSize: 20,
                                fontWeight: FontWeight.w500,
                                color: Colors.white),
                          ),
                          Icon(
                            Icons.arrow_forward_ios_sharp,
                            color: Colors.white,
                            size: 30,
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 7,
              child: SingleChildScrollView(
                child: Column(children: [
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: Colors.grey[100],
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(40),
                            topRight: Radius.circular(40))),
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.all(24.0),
                          child: Column(children: [
                            Text(
                              "Création de compte",
                              style: GoogleFonts.aBeeZee(
                                textStyle: headline4,
                                fontSize: 22,
                                fontWeight: FontWeight.w500,
                                color: Color(0xffe2b80e),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Center(
                              child: Container(
                                alignment: Alignment.topCenter,
                                child: Column(
                                  children: [
                                    Text(
                                      "Veuillez renseigner vos informations personnelles",
                                      textAlign: TextAlign.center,
                                      style: GoogleFonts.aBeeZee(
                                        textStyle: headline4,
                                        fontSize: 17,
                                        fontWeight: FontWeight.w200,
                                        color: Colors.grey,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 15,
                                    ),
                                    Container(
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: Padding(
                                          padding: EdgeInsets.fromLTRB(
                                              20, 15, 20, 20),
                                          child: Column(
                                            children: [
                                              Container(
                                                alignment: Alignment.topLeft,
                                                child: Text(
                                                  Champ1_name,
                                                  style: GoogleFonts.aBeeZee(
                                                    textStyle: headline4,
                                                    fontSize: 17,
                                                    fontWeight: FontWeight.w200,
                                                    color: Colors.black,
                                                  ),
                                                ),
                                              ),
                                              SizedBox(
                                                height: 10,
                                              ),
                                              Champ_principal1,
                                            ],
                                          )),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Container(
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: Padding(
                                          padding: const EdgeInsets.fromLTRB(
                                              20, 15, 20, 20),
                                          child: Column(
                                            children: [
                                              Container(
                                                alignment: Alignment.topLeft,
                                                child: Text(
                                                  Champ2_name,
                                                  style: GoogleFonts.aBeeZee(
                                                    textStyle: headline4,
                                                    fontSize: 17,
                                                    fontWeight: FontWeight.w200,
                                                    color: Colors.black,
                                                  ),
                                                ),
                                              ),
                                              SizedBox(
                                                height: 10,
                                              ),
                                              Champ_principal2
                                            ],
                                          )),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Container(
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: Padding(
                                          padding: const EdgeInsets.fromLTRB(
                                              20, 15, 20, 20),
                                          child: Column(
                                            children: [
                                              Container(
                                                alignment: Alignment.topLeft,
                                                child: Text(
                                                  Champ3_name,
                                                  style: GoogleFonts.aBeeZee(
                                                    textStyle: headline4,
                                                    fontSize: 17,
                                                    fontWeight: FontWeight.w200,
                                                    color: Colors.black,
                                                  ),
                                                ),
                                              ),
                                              SizedBox(
                                                height: 10,
                                              ),
                                              Champ_principal3
                                            ],
                                          )),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Container(
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: Padding(
                                          padding: EdgeInsets.fromLTRB(
                                              20, 15, 20, 20),
                                          child: Column(
                                            children: [
                                              Container(
                                                alignment: Alignment.topLeft,
                                                child: Text(
                                                  Champ4_name,
                                                  style: GoogleFonts.aBeeZee(
                                                    textStyle: headline4,
                                                    fontSize: 17,
                                                    fontWeight: FontWeight.w200,
                                                    color: Colors.black,
                                                  ),
                                                ),
                                              ),
                                              SizedBox(
                                                height: 10,
                                              ),
                                              Champ_principal4
                                            ],
                                          )),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ]),
                        )
                      ],
                    ),
                  ),
                  // Container(
                  //   alignment: Alignment.bottomCenter,
                  //   child: Container(
                  //     height: 80,
                  //     width: 130,
                  //     child: Padding(
                  //       padding: EdgeInsets.only(bottom: 5),
                  //       child: Image.asset(
                  //         "assets/DFblack.png",
                  //       ),
                  //     ),
                  //   ),
                  // ),
                ]),
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
