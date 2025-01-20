// ignore_for_file: prefer_const_constructors, file_names

import 'package:flutter/material.dart';
import 'package:mybook_app/Screens/Main/BookPagesPage.dart';

class BookWidget extends StatelessWidget {
  final Color mainColor;
  final String name;
  final int index;
  final VoidCallback refrech;
  const BookWidget({
    super.key,
    required this.mainColor,
    required this.name,
    required this.index,
    required this.refrech,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => BookPagesPage(
            bookName: name,
            bookIndex: index,
            refrech: () => refrech(),
          ),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.only(right: 10),
        child: Stack(
          children: [
            Container(
              height: 250,
              width: 170,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.horizontal(
                  right: Radius.circular(23),
                  left: Radius.circular(3),
                ),
                color: mainColor,
              ),
            ),
            Container(
              height: 250,
              width: 20,
              decoration: BoxDecoration(
                color: Colors.grey.shade800,
              ),
            ),
            Positioned(
              top: 210,
              left: 30,
              child: Text(
                name,
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
