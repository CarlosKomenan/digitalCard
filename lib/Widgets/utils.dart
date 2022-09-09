// ignore_for_file: prefer_const_constructors, unused_local_variable, sort_child_properties_last, use_function_type_syntax_for_parameters, non_constant_identifier_names

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// import 'package:intl/intl.dart';

class Utils {
  static List<Widget> modelBuilder<M>(
          List<M> models, Widget Function(int index, M model) builder) =>
      models
          .asMap()
          .map<int, Widget>(
              (index, model) => MapEntry(index, builder(index, model)))
          .values
          .toList();

  /// Alternativaly: You can display an Android Styled Bottom Sheet instead of an iOS styled bottom Sheet
  // static void showSheet(
  //   BuildContext context, {
  //   required Widget child,
  // }) =>
  //     showModalBottomSheet(
  //       context: context,
  //       builder: (context) => child,
  //     );

  static void showSheet(
    BuildContext context, {
    required Widget child,
    required VoidCallback onClicked,
  }) =>
      showCupertinoModalPopup(
        context: context,
        builder: (context) => CupertinoActionSheet(
          actions: [
            child,
          ],
          cancelButton: CupertinoActionSheetAction(
            child: Text('Valider'),
            onPressed: onClicked,
          ),
        ),
      );

  static void showSheetDomicile(
    BuildContext context, {
    required Widget child,
  }) =>
      showModalBottomSheet(
        context: context,
        builder: (context) => child,
      );

  static void showSnackBar(BuildContext context, String text) {
    final snackBar = SnackBar(
      content: Text(text, style: TextStyle(fontSize: 24)),
    );

    ScaffoldMessenger.of(context)
      ..removeCurrentSnackBar()
      ..showSnackBar(snackBar);
  }

  static void champDate(BuildContext context, String text) {
    final champ = Text(text);
  }

  // static void textDate(BuildContext context) {
  //   Container(
  //     width: MediaQuery.of(context).size.width - 70,
  //     height: 55,
  //     child: TextFormField(
  //       onTap: () async {
  //         DateTime? choix = await showDatePicker(
  //             context: context,
  //             initialDate: DateTime.now(),
  //             firstDate: DateTime(2021),
  //             lastDate: DateTime.now());

  //         if (choix != null) {
  //           // 'fr_FR' DateFormat.yMMMMd('en_US')
  //           String formattedDate_affichage =
  //               DateFormat.yMMMMd('fr_FR').format(choix);
  //           String formattedDate = DateFormat('dd-MM-yyyy').format(choix);

  //           setState(() {
  //             maDate = choix;
  //             // print(maDate);
  //             dateinput.text =
  //                 formattedDate_affichage; //set output date to TextField value.
  //           });
  //         } else {
  //           print('Date non selectionnée');
  //         }
  //       },
  //       autofocus: false,
  //       readOnly: true,
  //       controller: dateinput,
  //       validator: (value) {
  //         //champ vide
  //         if (value!.isEmpty) {
  //           return "Selectionner la date";
  //         }
  //         return null;
  //       },
  //       onSaved: (value) {
  //         dateinput.text = value!;
  //       },
  //       obscureText: false,
  //       style: const TextStyle(fontSize: 17, color: Colors.black),
  //       decoration: InputDecoration(
  //           hintText: "Selectionner la date",
  //           labelStyle: const TextStyle(fontSize: 17, color: Colors.black),
  //           focusedBorder: OutlineInputBorder(
  //               borderRadius: BorderRadius.circular(15),
  //               borderSide: const BorderSide(width: 1.5, color: Colors.blue)),
  //           enabledBorder: OutlineInputBorder(
  //               borderRadius: BorderRadius.circular(15),
  //               borderSide: const BorderSide(width: 1, color: Colors.grey))),
  //     ),
  //   );
  // }
}
