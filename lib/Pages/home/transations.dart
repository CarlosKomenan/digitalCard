// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, prefer_const_literals_to_create_immutables, unused_local_variable, unused_import

import 'package:digitalcard/Theme/color.dart';
import 'package:digitalcard/Widgets/transaction_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Transactions extends StatefulWidget {
  const Transactions({Key? key}) : super(key: key);

  @override
  State<Transactions> createState() => _TransactionsState();
}

class _TransactionsState extends State<Transactions> {
  @override
  Widget build(BuildContext context) {
    final TextStyle headline3 = Theme.of(context).textTheme.headline3!;
    return Container(
        margin: EdgeInsets.fromLTRB(15, 0, 15, 0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Transactions récentes",
                    style: GoogleFonts.aBeeZee(
                        textStyle: headline3,
                        color: Colors.blueGrey,
                        fontWeight: FontWeight.bold,
                        fontSize: 15),
                  ),
                  Text(
                    "Tout",
                    style: GoogleFonts.aBeeZee(
                        textStyle: headline3,
                        color: dfOrange,
                        fontWeight: FontWeight.bold,
                        fontSize: 15),
                  )
                ],
              ),
              SizedBox(
                height: 15,
              ),
              TransWidget(
                iconColor: Colors.green,
                icon: Icons.north_east,
                number: "0101780052",
                date: "8 Sept",
                heure: "00:48",
                prix: 70000,
                signe: '+ ',
                operateur: 'DigitalPay',
              ),
              TransWidget(
                iconColor: Colors.red,
                icon: Icons.south_east,
                number: "0145454785",
                date: "8 Sept",
                heure: "00:48",
                prix: 3000,
                signe: '- ',
                operateur: 'Orange',
              ),
              TransWidget(
                iconColor: Colors.green,
                icon: Icons.north_east,
                number: "0101780052",
                date: "8 Sept",
                heure: "00:48",
                prix: 70000,
                signe: '+ ',
                operateur: 'Wave',
              ),
            ],
          ),
        ));
  }
}
