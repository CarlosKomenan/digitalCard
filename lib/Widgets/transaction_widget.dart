// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, unused_local_variable

import 'package:digitalcard/Theme/color.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TransWidget extends StatelessWidget {
  const TransWidget(
      {Key? key,
      required this.iconColor,
      required this.icon,
      required this.number,
      required this.date,
      required this.heure,
      required this.signe,
      required this.operateur,
      required this.prix})
      : super(key: key);

  final Color iconColor;
  final IconData icon;
  final String number;
  final String date;
  final String heure;
  final int prix;
  final String signe;
  final String operateur;

  @override
  Widget build(BuildContext context) {
    final TextStyle headline3 = Theme.of(context).textTheme.headline3!;
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
      width: MediaQuery.of(context).size.width - 15,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.white,
      ),
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: Container(
              margin: EdgeInsets.fromLTRB(15, 20, 15, 20),
              height: 50,
              decoration: BoxDecoration(
                  color: Colors.blue[100],
                  borderRadius: BorderRadius.circular(30)),
              child: Icon(
                icon,
                color: iconColor,
              ),
            ),
          ),
          Expanded(
              flex: 4,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      Text(
                        number,
                        style: GoogleFonts.aBeeZee(
                            textStyle: headline3,
                            color: Colors.black,
                            fontWeight: FontWeight.w400,
                            fontSize: 14),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 7,
                  ),
                  Row(
                    children: [
                      Text(
                        operateur,
                        style: GoogleFonts.aBeeZee(
                            textStyle: headline3,
                            color: dfOrange,
                            fontWeight: FontWeight.w400,
                            fontSize: 14),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 7,
                  ),
                  Row(
                    children: [
                      Text(
                        date,
                        style: GoogleFonts.aBeeZee(
                            textStyle: headline3,
                            color: Colors.black,
                            fontWeight: FontWeight.w400,
                            fontSize: 14),
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      Text(
                        heure,
                        style: GoogleFonts.aBeeZee(
                            textStyle: headline3,
                            color: Colors.black,
                            fontWeight: FontWeight.w400,
                            fontSize: 14),
                      )
                    ],
                  )
                ],
              )),
          Expanded(
              flex: 2,
              child: Center(
                  child: Row(
                children: [
                  Text(signe),
                  Text(
                    prix.toString(),
                    style: GoogleFonts.aBeeZee(
                        textStyle: headline3,
                        color: iconColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 15),
                  )
                ],
              )))
        ],
      ),
    );
  }
}
