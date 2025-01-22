// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:mybook_app/Widgets/MySnackBar.dart';

Drawer MyDrawer(BuildContext context) {
  return Drawer(
    backgroundColor: Color(0xFFF3E1D3),
    child: Column(
      children: [
        //* drawer head
        DrawerHeader(
          child: Image.asset(
            "assets/diary.png",
            scale: 6,
          ),
        ),

        //* titles
        SizedBox(
          height: MediaQuery.sizeOf(context).height / 1.34,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  DrawerTile(
                    title: "H O M E",
                    icon: Icons.home,
                    onTap: () => Navigator.pop(context),
                  ),
                  DrawerTile(
                    title: "S E T T I N G S",
                    icon: Icons.settings,
                    onTap: () {
                      Navigator.pop(context);
                      MySnackBar(
                          text: "Nothing To Show There", context: context);
                    },
                  ),
                ],
              ),
              DrawerTile(
                title: "L O G O U T",
                icon: Icons.logout_rounded,
                onTap: () {},
              ),
            ],
          ),
        )
      ],
    ),
  );
}

GestureDetector DrawerTile(
    {required String title,
    required IconData icon,
    required void Function()? onTap}) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      margin: EdgeInsets.only(left: 20, right: 20, top: 30),
      decoration: BoxDecoration(),
      child: Row(
        children: [
          Icon(
            icon,
            color: Color(0xFF716059),
          ),
          SizedBox(width: 25),
          Text(
            title,
            style: TextStyle(
              color: Color(0xFF716059),
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
        ],
      ),
    ),
  );
}
