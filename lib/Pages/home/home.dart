// ignore_for_file: unused_import, prefer_const_constructors, prefer_const_literals_to_create_immutables, import_of_legacy_library_into_null_safe, sort_child_properties_last, override_on_non_overriding_member, avoid_unnecessary_containers, unused_local_variable

import 'package:digitalcard/Pages/home/operations.dart';
import 'package:digitalcard/Pages/home/transations.dart';
import 'package:digitalcard/Widgets/appbar.dart';
import 'package:digitalcard/Widgets/profil_header.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
// import 'package:slimy_card/slimy_card.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    bool isVisible = false;
    return Scaffold(
      appBar: MyAppBar(
        title: "Digital",
      ),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          children: [
            ProfilHeader(
              photoProfil: 'assets/id_carlos.png',
              surname: 'Stéphane',
              name: 'K',
              numero: '+2250759613500',
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.white70,
              ),
              width: MediaQuery.of(context).size.width - 30,
              height: 100,
              child: Row(
                children: [
                  Expanded(
                      flex: 5,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            margin: EdgeInsets.only(left: 20),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text(
                                      "7 120 000",
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 25,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Text(
                                      "F CFA",
                                      style: TextStyle(
                                        color: Colors.grey,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18,
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Container(
                                      alignment: Alignment.topLeft,
                                      child: Text(
                                        "Mon Solde",
                                        style: TextStyle(
                                          color: Colors.grey,
                                          fontSize: 18,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      )),
                  Expanded(
                    child: InkWell(
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: Colors.blue[100],
                        ),
                        margin: EdgeInsets.only(right: 10, left: 5),
                        height: 80,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.add,
                              color: Colors.indigo[600],
                              size: 40,
                            ),
                            Text(
                              "Me recharger",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.indigo[600],
                                fontWeight: FontWeight.w600,
                                fontSize: 15,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    flex: 2,
                  ),
                ],
              ),
            ),
            Operations(),
            SizedBox(
              height: 10,
            ),
            Transactions()
          ],
        ),
      )),
      backgroundColor: Colors.grey[300],
    );
  }
}
