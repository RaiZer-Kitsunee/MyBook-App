// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:mybook_app/Data/DataBase.dart';
import 'package:mybook_app/Widgets/ThePage.dart';
import 'package:mybook_app/Widgets/myFloatingAB.dart';

class BookPagesPage extends StatefulWidget {
  final String bookName;
  final int bookIndex;
  final void Function() refrech;
  final int diractePage;
  const BookPagesPage({
    super.key,
    required this.bookName,
    required this.bookIndex,
    required this.refrech,
    this.diractePage = 0,
  });

  @override
  State<BookPagesPage> createState() => _BookPagesPageState();
}

class _BookPagesPageState extends State<BookPagesPage> {
  @override
  Widget build(BuildContext context) {
    TextEditingController titleController = TextEditingController();
    TextEditingController contentController = TextEditingController();
    return Scaffold(
      floatingActionButton: myFloatingActionButton(
        context: context,
        bookIndex: widget.bookIndex,
        titleController: titleController,
        contentController: contentController,
        refrech: () => setState(() {
          widget.refrech();
        }),
      ),
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
                          books[widget.bookIndex].pages.isEmpty
                              ? ""
                              : widget.bookName,
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
            books[widget.bookIndex].pages.isEmpty
                ? FirstPageIsThereIsNoPages()
                : Pages(
                    bookIndex: widget.bookIndex,
                    diractePage: widget.diractePage,
                  ),

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

  Expanded FirstPageIsThereIsNoPages() {
    return Expanded(
      child: Stack(
        children: [
          //* the acualle page
          Container(
            margin: EdgeInsets.only(right: 20, top: 15, bottom: 15),
            decoration: BoxDecoration(
              color: Colors.green,
              borderRadius: BorderRadius.horizontal(
                right: Radius.circular(50),
                left: Radius.circular(20),
              ),
            ),
            child: Padding(
              padding: EdgeInsets.only(top: 10, bottom: 10, right: 20),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.horizontal(
                    right: Radius.circular(50),
                  ),
                  color: Colors.white,
                ),
                child: Padding(
                  padding: const EdgeInsets.only(top: 30),
                  child: Align(
                    alignment: Alignment.topCenter,
                    child: Text(
                      books[widget.bookIndex].name,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 30,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          //* the left line book page
          Container(
            color: Colors.grey,
            width: 15,
            margin: EdgeInsets.symmetric(vertical: 15),
          )
        ],
      ),
    );
  }
}
