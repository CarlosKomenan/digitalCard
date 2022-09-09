// ignore_for_file: sized_box_for_whitespace, prefer_const_constructors_in_immutables, avoid_unnecessary_containers, prefer_const_literals_to_create_immutables, prefer_const_constructors, unused_local_variable

import 'package:digitalcard/Pages/home/bouton.dart';
import 'package:digitalcard/Theme/color.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Operations extends StatefulWidget {
  Operations({Key? key}) : super(key: key);

  @override
  State<Operations> createState() => _OperationsState();
}

class _OperationsState extends State<Operations> {
  bool isVisible = false;

  @override
  Widget build(BuildContext context) {
    final TextStyle headline6 = Theme.of(context).textTheme.headline6!;
    return Container(
      alignment: Alignment.center,
      margin: EdgeInsets.all(15),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                  child: Container(
                height: 1,
                color: Colors.grey,
                margin: EdgeInsets.symmetric(horizontal: 20),
              )),
              Text(
                "Mes Opérations",
                style: TextStyle(
                    color: Color(0xffe2b80e),
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
              ),
              Expanded(
                  child: Container(
                height: 1,
                color: Colors.grey,
                margin: EdgeInsets.symmetric(horizontal: 20),
              )),
            ],
          ),
          SizedBox(height: 15),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              AnimatedOpacity(
                  duration: Duration(milliseconds: 500),
                  opacity: isVisible ? 1.0 : 0.0,
                  child: Carre(
                    icon: Icon(
                      Icons.send_to_mobile_outlined,
                      color: Color(0xffe2b80e),
                      size: 40,
                    ),
                    sizeLargeur: MediaQuery.of(context).size.width * 0.3,
                    sizelongueur: 60,
                    text: "Mobile Money",
                  )),
              InkWell(
                  onTap: () {
                    setState(() {
                      isVisible = !isVisible;
                    });
                  },
                  child: Carre(
                    icon: Icon(
                      Icons.swap_horiz,
                      color: Color(0xffe2b80e),
                      size: 40,
                    ),
                    sizeLargeur: MediaQuery.of(context).size.width * 0.3,
                    sizelongueur: 60,
                    text: "Envoyer de l'argent",
                  )),
              // Visibility(
              //     visible: isVisible,
              //     child:
              AnimatedOpacity(
                  duration: Duration(milliseconds: 500),
                  opacity: isVisible ? 1.0 : 0.0,
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.3,
                    child: Column(
                      children: [
                        Container(
                          padding: EdgeInsets.all(4),
                          margin: EdgeInsets.only(bottom: 5),
                          // height: 70,
                          child: Container(
                            child: CircleAvatar(
                              backgroundColor: Colors.white,
                              radius: 30,
                              backgroundImage: AssetImage(
                                "assets/logoDF.png",
                              ),
                            ),
                          ),
                        ),
                        // Text(
                        //   "DigitalPay",
                        //   textAlign: TextAlign.center,
                        //   style: GoogleFonts.aBeeZee(
                        //       textStyle: headline6,
                        //       color: Colors.black,
                        //       fontWeight: FontWeight.w400,
                        //       fontSize: 15),
                        // )
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Digital',
                              style: GoogleFonts.aBeeZee(
                                  textStyle: headline6,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 15),
                            ),
                            Text(
                              "Pay",
                              style: TextStyle(
                                color: Color(0xffe2b80e),
                                fontWeight: FontWeight.bold,
                                fontStyle: FontStyle.italic,
                                fontSize: 15,
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                    // ),
                  )),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Visibility(
                visible: isVisible,
                child: Container(
                  child: Text(
                    "Autres services >",
                    style: GoogleFonts.aBeeZee(
                        textStyle: headline6,
                        color: dfOrange,
                        fontWeight: FontWeight.bold,
                        fontSize: 15),
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
