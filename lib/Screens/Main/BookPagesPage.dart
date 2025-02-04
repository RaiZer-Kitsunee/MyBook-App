// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:mybook_app/Data/DataBase.dart';
import 'package:mybook_app/Data/iconsMenu.dart';
import 'package:mybook_app/Widgets/BookSheets/DeleteBookSheet.dart';
import 'package:mybook_app/Widgets/BookSheets/UpdateBookSheet.dart';
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
      backgroundColor: Color(0xFFF3E1D3),
      floatingActionButtonLocation: FloatingActionButtonLocation.miniEndFloat,
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
                        child: books[widget.bookIndex].pages.isEmpty
                            ? Container()
                            : Text(
                                widget.bookName,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                  color: Color(0xFF5E4D46),
                                ),
                              ),
                      ),
                    ],
                  ),

                  //* more buttons
                  PopupMenuButton<IconMenu>(
                    color: Color(0xFFF3E1D3),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    iconSize: 30,
                    itemBuilder: (context) => IconsMenu.items
                        .map(
                          (item) => PopupMenuItem<IconMenu>(
                            value: item,
                            child: ListTile(
                              leading: Icon(
                                item.icon,
                                color: Color(0xFF5E4D46),
                              ),
                              title: Text(
                                item.text,
                                style: TextStyle(
                                  color: Color(0xFF5E4D46),
                                ),
                              ),
                            ),
                          ),
                        )
                        .toList(),
                    onSelected: (value) {
                      switch (value) {
                        case IconsMenu.edit:
                          titleController.text = widget.bookName;
                          UpdateBookSheet(
                            context,
                            titleController,
                            widget.bookIndex,
                            () => setState(() {
                              widget.refrech();
                            }),
                          );
                          break;
                        case IconsMenu.delete:
                          DeleteBookSheet(
                            context,
                            widget.bookIndex,
                            widget.bookName,
                            () => setState(() {
                              widget.refrech();
                            }),
                          );
                          break;
                      }
                    },
                  )
                ],
              ),
            ),

            //* the page
            books[widget.bookIndex].pages.isEmpty
                ? FirstPageIsThereIsNoPages()
                : Pages(
                    bookIndex: widget.bookIndex,
                    diractePage: widget.diractePage,
                    titleController: titleController,
                    contentController: contentController,
                    refrech: () => setState(() {
                      widget.refrech();
                    }),
                  ),

            //* tools
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Row(
                children: [
                  Icon(
                    Icons.photo_size_select_actual,
                    size: 30,
                    color: Color(0xFF5E4D46),
                  ),
                  SizedBox(width: 20),
                  Icon(
                    Icons.edit,
                    size: 30,
                    color: Color(0xFF5E4D46),
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
              color: Color(0xFFFBFBFB),
              borderRadius: BorderRadius.horizontal(
                right: Radius.circular(50),
                left: Radius.circular(20),
              ),
              border: Border(
                right: BorderSide(color: Color(0xFFCBC6BF)),
                bottom: BorderSide(color: Color(0xFFCBC6BF)),
                top: BorderSide(color: Color(0xFFCBC6BF)),
              ),
            ),
            child: Padding(
              padding: EdgeInsets.only(top: 10, bottom: 10, right: 20),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.horizontal(
                    right: Radius.circular(50),
                  ),
                  color: Color(0xFFFBFBFB),
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
                        color: Color(0xFF5E4D46),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          //* the left line book page
          Container(
            width: 15,
            margin: EdgeInsets.symmetric(vertical: 15),
            decoration: BoxDecoration(
              color: Color(0xFFEFE7E4),
              border: Border(
                right: BorderSide(color: Color(0xFFCBC6BF)),
                bottom: BorderSide(color: Color(0xFFCBC6BF)),
                top: BorderSide(color: Color(0xFFCBC6BF)),
              ),
            ),
          )
        ],
      ),
    );
  }
}
