// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class DateButtonWidget extends StatelessWidget {
  final VoidCallback onClicked;

  const DateButtonWidget({
    Key? key,
    required this.onClicked,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Container(
        padding: EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          color: Color(0xFFe7edeb),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: IconButton(
              onPressed: onClicked,
              icon: Icon(
                Icons.date_range,
                size: 30,
                color: Color(0xffe2b80e),
              )),
        ),
      );
  // ElevatedButton(
  //       style: ElevatedButton.styleFrom(
  //           minimumSize: Size(100, 42), shadowColor: Colors.black),
  //       child: Row(
  //         mainAxisSize: MainAxisSize.min,
  //         children: [
  //           Icon(
  //             Icons.date_range,
  //             size: 28,
  //           ),
  //           SizedBox(width: 8),
  //           Text(
  //             'Date',
  //             style: TextStyle(fontSize: 20),
  //           ),
  //         ],
  //       ),
  //       onPressed: onClicked,
  //     );
}
