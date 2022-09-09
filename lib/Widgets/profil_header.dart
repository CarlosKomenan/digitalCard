// ignore_for_file: unused_import, prefer_const_constructors, sized_box_for_whitespace, avoid_unnecessary_containers

import 'package:digitalcard/Theme/style.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfilHeader extends StatelessWidget {
  final String photoProfil;
  final String surname;
  final String name;
  final String numero;

  const ProfilHeader(
      {Key? key,
      required this.photoProfil,
      required this.surname,
      required this.name,
      required this.numero})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextStyle headline6 = Theme.of(context).textTheme.headline6!;
    return Container(
      // margin: EdgeInsets.symmetric(horizontal: 20.0),
      // decoration: const BoxDecoration(
      //   borderRadius: BorderRadius.only(
      //     bottomRight: Radius.circular(20.0),
      //     topRight: Radius.circular(20.0),
      //     topLeft: Radius.circular(20.0),
      //     bottomLeft: Radius.circular(20.0),
      //   ),
      //   color: Colors.white54,
      // ),
      padding: const EdgeInsets.fromLTRB(15, 10, 15, 10),
      child: Row(
        children: [
          Expanded(
            flex: 3,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  children: [
                    Text(
                      surname,
                      style: GoogleFonts.aBeeZee(
                        textStyle: headline6,
                        color: Colors.black,
                      ),
                    ),
                    Text(
                      ' .',
                      style: GoogleFonts.aBeeZee(
                        textStyle: headline6,
                        color: Colors.black,
                      ),
                    ),
                    Text(
                      name,
                      style: GoogleFonts.aBeeZee(
                        textStyle: headline6,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
                Text(
                  numero,
                  style: const TextStyle(
                    color: Colors.grey,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),
          Container(
            alignment: Alignment.centerLeft,
            // flex: 1,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  // padding: const EdgeInsets.fromLTRB(2, 2, 20, 2),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(22),
                  ),
                  child: CircleAvatar(
                    radius: 22,
                    backgroundImage: AssetImage(photoProfil),
                  ),
                ),
                Text(
                  "Mon profil >",
                  style: titleStyle,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
