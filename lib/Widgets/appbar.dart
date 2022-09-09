// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  const MyAppBar({Key? key, required this.title}) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(40);
  @override
  Widget build(BuildContext context) {
    return AppBar(
        // automaticallyImplyLeading: false,
        elevation: 0,
        backgroundColor: Colors.white.withOpacity(0),
        centerTitle: false,
        title: Row(
          children: [
            Text(
              title,
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 28,
              ),
            ),
            Text(
              "Pay",
              style: TextStyle(
                color: Color(0xffe2b80e),
                fontWeight: FontWeight.bold,
                fontStyle: FontStyle.italic,
                fontSize: 28,
              ),
            )
          ],
        ),
        // backgroundColor: Colors.grey[300],
        actions: [
          IconButton(
            icon: Icon(
              Icons.notifications,
              color: Colors.grey[800],
            ),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(
              Icons.power_settings_new,
              color: Colors.grey[800],
            ),
            onPressed: () {},
          ),
          const SizedBox(width: 15),
        ]);
  }
}
