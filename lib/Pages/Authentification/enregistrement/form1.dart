// ignore_for_file: prefer_const_constructors, unused_import, sized_box_for_whitespace, unused_local_variable, non_constant_identifier_names, avoid_print, import_of_legacy_library_into_null_safe, unnecessary_const
import 'package:digitalcard/Pages/Authentification/presentationPage.dart';
import 'package:digitalcard/Widgets/date_button.dart';
import 'package:digitalcard/Widgets/form_enregistrement.dart';
import 'package:digitalcard/Widgets/utils.dart';
import 'package:digitalcard/src/cup_fr.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'form2.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';
// import 'package:flutter_cupertino_date_picker/flutter_cupertino_date_picker.dart';

// enum DateTimePickerLocale {
//   /// English (EN) United States
//   fr,
// }

// const Map<DateTimePickerLocale, _StringsI18n> datePickerI18n = {
//   DateTimePickerLocale.fr: const CupFR(),
// };

class Form1 extends StatefulWidget {
  const Form1({Key? key}) : super(key: key);
  @override
  State<Form1> createState() => _Form1State();
}

class _Form1State extends State<Form1> {
  DateTime? dateTime;
  String dateNaissance = "01/01/2000";
  TextEditingController nom = TextEditingController();
  TextEditingController prenom = TextEditingController();
  // TextEditingController dateNaissance = TextEditingController();
  TextEditingController lieuNaissance = TextEditingController();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback(((timeStamp) {}));
    initializeDateFormatting('fr_FR', null).then((_) => Form1());
    dateTime = DateTime.now();
    // dateinput.text = maDate.toString(); //set the initial value of text field
    // dateinput.text = today;
    // var db = FirebaseFirestore.instance;
  }

  Widget buildDatePicker() => SizedBox(
        height: 180,
        child: CupertinoDatePicker(
          onDateTimeChanged: (dateTime) {
            setState(
              () => this.dateTime = dateTime,
            );
            // final dateN = dateTime;
            final dateN = DateFormat.yMd('fr_FR').format(dateTime);
            dateNaissance = dateN.toString();
            // print(DateFormat.yMd().format(dateN));
            print(dateNaissance);
          },
          initialDateTime: dateTime,
          mode: CupertinoDatePickerMode.date,
          minimumYear: 1980,
          maximumYear: DateTime.now().year,
        ),
      );
  @override
  Widget build(BuildContext context) {
    return FormEnregistrement(
      page_precedente: PresentationPage(),
      page_suivante: Form2(),
      Champ_principal1: TextFormField(
        keyboardType: TextInputType.name,
        controller: nom,
        decoration: InputDecoration(
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.black),
            ),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.0),
                borderSide: BorderSide.none),
            filled: true,
            fillColor: Color(0xFFe7edeb),
            hintText: "Exemple: Yao "),
      ),
      Champ_principal2: TextField(
        controller: prenom,
        cursorColor: Color(0xffe2b80e),
        keyboardType: TextInputType.name,
        decoration: InputDecoration(
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.black),
            ),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.0),
                borderSide: BorderSide.none),
            filled: true,
            fillColor: Color(0xFFe7edeb),
            hintText: "Exemple: Konan Yves Hervé "),
      ),
      bouton_retour: Icons.clear,
      Champ1_name: "Votre Nom",
      Champ2_name: "Votre Prénom",
      Champ3_name: "Date de Naissance",
      Champ4_name: "Lieu de Naissance",
      Champ_principal3: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          DateButtonWidget(
            onClicked: () => Utils.showSheet(context, child: buildDatePicker(),
                onClicked: () {
              final value = DateFormat.yMd().format(dateTime!);
              Navigator.pop(context);
            }),
          ),
          InkWell(
            onTap: () => Utils.showSheet(context, child: buildDatePicker(),
                onClicked: () async {
              // final value = DateFormat('MM/dd/yyyy').format(dateTime);
              final value = DateFormat.yMd().format(dateTime!);
              // String formattedDate = DateFormat('dd-MM-yyyy').format(choix);
              // String formattedDate_affichage =
              //     DateFormat.yMMMMd('fr_FR').format(dateTime!);
              // dateNaissance = value;
              // Utils.showSnackBar(context, ' $value');
              Navigator.pop(context);
            }),
            child: Container(
              width: 230,
              child: TextField(
                enabled: false,
                textAlign: TextAlign.center,
                keyboardType: TextInputType.none,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                      borderSide: BorderSide.none),
                  filled: true,
                  fillColor: Color(0xFFe7edeb),
                  hintText: dateNaissance,
                  hintStyle: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w400,
                      color: Colors.black),
                ),
              ),
            ),
          ),
        ],
      ),
      Champ_principal4: TextField(
        controller: lieuNaissance,
        cursorColor: Color(0xffe2b80e),
        keyboardType: TextInputType.name,
        decoration: InputDecoration(
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.black),
            ),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.0),
                borderSide: BorderSide.none),
            filled: true,
            fillColor: Color(0xFFe7edeb),
            hintText: "Exemple: San Pédro "),
      ),
    );
  }
}
