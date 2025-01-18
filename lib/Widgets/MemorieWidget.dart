// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mybook_app/Data/DataBase.dart';
import 'package:mybook_app/Screens/Main/BookPagesPage.dart';

class MemorieWidget extends StatelessWidget {
  final int bookIndex;
  final int pageIndex;
  const MemorieWidget({
    super.key,
    required this.bookIndex,
    required this.pageIndex,
  });

  @override
  Widget build(BuildContext context) {
    //* acutall variabels
    String title = books[bookIndex].pages[pageIndex].title;
    String content = books[bookIndex].pages[pageIndex].content;
    String dateName = DateFormat('EEE')
        .format(books[bookIndex].pages[pageIndex].dateTime)
        .toUpperCase()
        .toString();
    String dateNum = DateFormat('d')
        .format(books[bookIndex].pages[pageIndex].dateTime)
        .toString();
    String time = DateFormat('hh:mm')
        .format(books[bookIndex].pages[pageIndex].dateTime)
        .toString();

    return GestureDetector(
      onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => BookPagesPage(
              bookName: books[bookIndex].name,
              bookIndex: bookIndex,
              refrech: () {},
              diractePage: pageIndex,
            ),
          )),
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 5, vertical: 0),
        width: MediaQuery.sizeOf(context).width,
        decoration: BoxDecoration(
          border: Border.symmetric(
            horizontal: BorderSide(
              color: Colors.black,
              width: 0.2,
            ),
          ),
        ),
        child: Row(
          children: [
            //* date and number
            Padding(
              padding: const EdgeInsets.only(left: 8, top: 10),
              child: SizedBox(
                height: 55,
                width: 55,
                child: Center(
                  child: Column(
                    children: [
                      //* day
                      Text(
                        dateName,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      //* day in number
                      Text(
                        dateNum,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 22,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            //* Memorie Part
            Container(
              width: MediaQuery.sizeOf(context).width / 1.31,
              margin: EdgeInsets.symmetric(
                horizontal: 10,
                vertical: 10,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //* title and note
                  Text(
                    title,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      fontSize: 16,
                    ),
                  ),
                  Text(
                    content,
                    style: TextStyle(
                      color: Colors.black,
                    ),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                  ),
                  //* time
                  Text(
                    time,
                    style: TextStyle(
                      color: Colors.grey,
                    ),
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
