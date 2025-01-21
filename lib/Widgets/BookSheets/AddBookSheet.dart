// ignore_for_file: prefer_const_constructors, non_constant_identifier_names, file_names

import 'package:flutter/material.dart';
import 'package:mybook_app/Services/BooksServices.dart';
import 'package:mybook_app/Widgets/MySnackBar.dart';

void AddBookSheet(
  BuildContext context,
  TextEditingController titleController,
  VoidCallback refrech,
) {
  final BooksServices booksServices = BooksServices();

  showModalBottomSheet(
    context: context,
    builder: (context) => Container(
      margin: EdgeInsets.only(bottom: MediaQuery.viewInsetsOf(context).bottom),
      width: MediaQuery.sizeOf(context).width,
      height: 200,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(20),
        ),
        color: Color(0xFFF3E1D3),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          //* title
          Text(
            "Your Name Book is:",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Color(0xFF62504A),
              fontSize: 20,
            ),
          ),

          //* textfield
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: TextField(
              controller: titleController,
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(
                    color: Colors.grey,
                    width: 2,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(
                    color: Colors.black,
                    width: 2,
                  ),
                ),
                hintText: "Book OF .....",
                hintStyle: TextStyle(color: Colors.grey),
              ),
            ),
          ),

          //* buttons
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 40),
                child: Button(
                  color: Color(0xFF62504A),
                  text: "Save",
                  onTap: () {
                    if (titleController.text.isNotEmpty) {
                      booksServices.addBook(
                        name: titleController.text,
                      );
                      Navigator.pop(context);
                      titleController.clear();
                      refrech();
                      MySnackBar(text: "New Book Added", context: context);
                    }
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 40),
                child: Button(
                  text: "Cancel",
                  color: Colors.black,
                  onTap: () => Navigator.pop(context),
                ),
              )
            ],
          )
        ],
      ),
    ),
  );
}

GestureDetector Button(
    {required String text,
    required Color color,
    required void Function()? onTap}) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Text(
        text,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
    ),
  );
}
