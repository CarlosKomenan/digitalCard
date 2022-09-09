// ignore_for_file: prefer_const_constructors, unused_import, sized_box_for_whitespace, sort_child_properties_last, unused_local_variable, avoid_print

import 'package:digitalcard/Pages/Authentification/enregistrement/form1.dart';
import 'package:digitalcard/Pages/Authentification/enregistrement/from3.dart';
import 'package:digitalcard/Widgets/form_enregistrement.dart';
import 'package:digitalcard/Widgets/utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

import '../presentationPage.dart';

class Form2 extends StatefulWidget {
  const Form2({Key? key}) : super(key: key);

  @override
  State<Form2> createState() => _Form2State();
}

class _Form2State extends State<Form2> {
  // TextEditingController domicile = TextEditingController();
  String domicile = "Taper pour sélectionner";
  bool touch1 = true;
  bool touch2 = false;
  int index = 0;
  Widget buildCustomPicker() => SizedBox(
        height: 300,
        child: CupertinoPicker(
            looping: true,
            itemExtent: 64,
            diameterRatio: 0.7,
            onSelectedItemChanged: (index) =>
                // setState(() => this.index = index),
                setState(() {
                  this.index = index;
                  domicile = values[index];
                  print(domicile);
                }),
            selectionOverlay: CupertinoPickerDefaultSelectionOverlay(
              background: Color(0xffe2b80e).withOpacity(0.12),
            ),
            children: Utils.modelBuilder<String>(values, (index, value) {
              final isSelected = this.index == index;
              // domicile = values[this.index];
              final color = isSelected ? Color(0xffe2b80e) : Colors.black;
              // print(domicile);
              return Center(
                child: Text(
                  value,
                  style: TextStyle(fontSize: 24, color: color),
                ),
              );
            })),
      );
  static List<String> values = [
    " ",
    "Abidjan",
    "San pedro",
    "Soubré",
    "Gagnoa",
    "Yamoussoukro",
    "Bouaké",
    "Man",
    "Divo",
    "Oumé",
    "Autre"
  ];
  @override
  Widget build(BuildContext context) {
    return FormEnregistrement(
      page_suivante: Form3(),
      page_precedente: Form1(),
      // bouton_retour: Icons.arrow_back_ios_rounded,
      Champ_principal1: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                  onTap: () {
                    setState(() {
                      touch1 = true;
                      touch2 = false;
                    });
                  },
                  child: Container(
                      width: 130,
                      height: 50,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: touch1 ? Color(0xffe2b80e) : Color(0xFFe7edeb),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Text(
                        "HOMME",
                        style: TextStyle(fontWeight: FontWeight.w300),
                      ))),
              SizedBox(
                width: 10,
              ),
              InkWell(
                onTap: () {
                  setState(() {
                    touch2 = true;
                    touch1 = false;
                  });
                },
                child: Container(
                  width: 130,
                  height: 50,
                  alignment: Alignment.center,
                  child: Text(
                    "FEMME",
                    style: TextStyle(fontWeight: FontWeight.w300),
                  ),
                  decoration: BoxDecoration(
                    color: touch2 ? Color(0xffe2b80e) : Color(0xFFe7edeb),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 50,
                height: 10,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: touch1 ? Color(0xffe2b80e) : Colors.black,
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Container(
                width: 50,
                height: 10,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: touch2 ? Color(0xffe2b80e) : Colors.black,
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ],
          ),
        ],
      ),
      Champ_principal3: TextField(
        cursorColor: Color(0xffe2b80e),
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.black),
            ),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.0),
                borderSide: BorderSide.none),
            filled: true,
            fillColor: Color(0xFFe7edeb),
            hintText: "Ex : carlos11komenan@gmail.com "),
      ),
      Champ_principal2: InkWell(
        onTap: () =>
            Utils.showSheet(context, child: buildCustomPicker(), onClicked: () {
          final value = values[index];
          // Utils.showSnackBar(context, 'Selected "$value"');
          Navigator.pop(context);
        }),
        child: TextField(
          enabled: false,
          // cursorColor: Color(0xffe2b80e),
          textAlign: TextAlign.center,
          keyboardType: TextInputType.none,
          decoration: InputDecoration(
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.black),
            ),
            // enabledBorder: OutlineInputBorder(borderSide: BorderSide.none),
            // disabledBorder: OutlineInputBorder(
            //     borderSide: BorderSide(color: Colors.black)),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.0),
                borderSide: BorderSide.none),
            filled: true,
            fillColor: Color(0xFFe7edeb),
            hintText: domicile,
            hintStyle: TextStyle(
                fontSize: 18, fontWeight: FontWeight.w400, color: Colors.black),
          ),
        ),
      ),

      bouton_retour: Icons.arrow_back_ios_rounded,
      Champ1_name: "Sexe",
      Champ2_name: "Domicile",
      Champ_principal4: Container(
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
        decoration: BoxDecoration(
          color: Color(0xFFe7edeb),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Stack(
          children: [
            InternationalPhoneNumberInput(
              onInputChanged: (PhoneNumber value) {
                // print(number.phone);
              },
              cursorColor: Color(0xffe2b80e),
              formatInput: false,
              // textFieldController:controller
              selectorConfig: SelectorConfig(
                  selectorType: PhoneInputSelectorType.BOTTOM_SHEET),
              inputDecoration: InputDecoration(
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black),
                ),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                    borderSide: BorderSide.none),
                // filled: true,
                fillColor: Color(0xFFe7edeb),
              ),
            ),
            Positioned(
              left: 90,
              top: 8,
              bottom: 8,
              child: Container(height: 40),
              width: 1,
            )
          ],
        ),
      ),
      Champ3_name: 'E-mail',
      Champ4_name: 'Numéro de Téléphone',
    );
  }
}
