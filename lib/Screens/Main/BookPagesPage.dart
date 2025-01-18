// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:mybook_app/Widgets/ThePage.dart';

class BookPagesPage extends StatelessWidget {
  final String bookName;
  const BookPagesPage({
    super.key,
    required this.bookName,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 40),
        child: Column(
          children: [
            //* the title page
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      //* back button
                      IconButton(
                        onPressed: () => Navigator.pop(context),
                        icon: Icon(
                          Icons.arrow_back_ios_new,
                          size: 30,
                        ),
                      ),

                      //* title
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Text(
                          bookName,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ],
                  ),

                  //* more buttons
                  Icon(
                    Icons.more_vert_outlined,
                    size: 30,
                  ),
                ],
              ),
            ),

            //* the page
            Pages(),

            //* tools
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Row(
                children: [
                  Icon(
                    Icons.photo_size_select_actual,
                    size: 30,
                  ),
                  SizedBox(width: 20),
                  Icon(
                    Icons.edit,
                    size: 30,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
