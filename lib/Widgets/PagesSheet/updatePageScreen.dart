// ignore_for_file: file_names, avoid_print, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mybook_app/Services/BooksServices.dart';
import 'package:mybook_app/Widgets/MySnackBar.dart';

class UpdatePageScreen extends StatelessWidget {
  final VoidCallback refrech;
  final TextEditingController titleController;
  final TextEditingController contentController;
  final int bookIndex;
  final int pageIndex;

  const UpdatePageScreen({
    super.key,
    required this.refrech,
    required this.titleController,
    required this.contentController,
    required this.bookIndex,
    required this.pageIndex,
  });

  @override
  Widget build(BuildContext context) {
    BooksServices booksServices = BooksServices();
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 50, left: 10),
            child: Row(
              children: [
                IconButton(
                  onPressed: () {
                    if (titleController.text.isEmpty &&
                        contentController.text.isEmpty) {
                      print("its empty");
                    } else {
                      booksServices.updatePage(
                        bookIndex: bookIndex,
                        pageIndex: pageIndex,
                        newTitle: titleController.text,
                        newContent: contentController.text,
                      );
                      Navigator.pop(context);
                      refrech();
                      MySnackBar(text: "Page Updated", context: context);
                    }
                  },
                  icon: Icon(
                    size: 30,
                    Icons.arrow_back,
                  ),
                ),
                SizedBox(width: 15),
                Text(
                  DateFormat('EEEE, MMM d, yyyy').format(DateTime.now()),
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 40),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 20, right: 30),
                  child: SizedBox(
                    width: 350,
                    child: TextField(
                      controller: titleController,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Title",
                        hintStyle: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 30),
                  child: SizedBox(
                    width: 350,
                    child: TextField(
                      maxLines: 10,
                      controller: contentController,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Note",
                        hintStyle: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
