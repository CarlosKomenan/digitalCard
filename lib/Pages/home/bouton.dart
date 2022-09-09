// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sized_box_for_whitespace, unused_local_variable
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Carre extends StatelessWidget {
  final String text;
  final Icon icon;
  final double sizelongueur;
  final double sizeLargeur;
  const Carre(
      {Key? key,
      required this.text,
      required this.icon,
      required this.sizelongueur,
      required this.sizeLargeur})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextStyle headline6 = Theme.of(context).textTheme.headline6!;
    return Container(
      width: sizeLargeur,
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: Colors.white,
            ),
            padding: EdgeInsets.all(10),
            height: sizelongueur,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [icon],
            ),
          ),
          SizedBox(
            height: 8,
          ),
          Text(
            text,
            textAlign: TextAlign.center,
            style: GoogleFonts.aBeeZee(
                textStyle: headline6,
                color: Colors.black,
                fontWeight: FontWeight.w400,
                fontSize: 15),
          )
        ],
      ),
    );
  }
}
