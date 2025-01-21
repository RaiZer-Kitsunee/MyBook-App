// ignore_for_file: prefer_const_constructors, file_names, unnecessary_string_interpolations

import 'package:flutter/material.dart';
import 'package:mybook_app/Data/DataBase.dart';
import 'package:mybook_app/Screens/Main/BookPagesPage.dart';

class BookWidget extends StatelessWidget {
  final String name;
  final int bookIndex;
  final VoidCallback refrech;

  const BookWidget({
    super.key,
    required this.name,
    required this.bookIndex,
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
            bookIndex: bookIndex,
            refrech: () => refrech(),
          ),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.only(right: 15),
        child: Stack(
          children: [
            Container(
              height: 230,
              width: 150,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.horizontal(
                  right: Radius.circular(23),
                  left: Radius.circular(3),
                ),
                color: Colors.brown.shade300,
                boxShadow: const [
                  BoxShadow(
                    blurRadius: 0.1,
                    spreadRadius: 0.5,
                    offset: Offset(4, 3),
                    color: Colors.grey,
                  )
                ],
              ),
            ),
            Container(
              height: 230,
              width: 15,
              decoration: BoxDecoration(
                color: Colors.grey.shade800,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(9),
                  topLeft: Radius.circular(3),
                  bottomLeft: Radius.circular(3),
                  bottomRight: Radius.circular(9),
                ),
              ),
            ),
            Positioned(
              top: 190,
              left: 30,
              child: Text(
                name,
                style: TextStyle(
                  color: Color(0xFFFDFAF5),
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            ),

            //* year of the book
            Positioned(
              top: 235,
              left: 5,
              child: Text(
                "${books[bookIndex].bookTime.year}",
                style: TextStyle(
                  color: Color(0xFFA1887F),
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
