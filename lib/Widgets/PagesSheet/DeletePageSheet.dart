// ignore_for_file: prefer_const_constructors, non_constant_identifier_names, file_names

import 'package:flutter/material.dart';
import 'package:mybook_app/Data/DataBase.dart';
import 'package:mybook_app/Screens/Main/HomePage.dart';
import 'package:mybook_app/Services/BooksServices.dart';
import 'package:mybook_app/Widgets/MySnackBar.dart';

void DeletePageSheet(
  BuildContext context,
  int bookIndex,
  int pageIndex,
  String titlePage,
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
        color: Colors.grey.shade400,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          //* title
          Text(
            "Delete:",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.black,
              fontSize: 16,
            ),
          ),

          SizedBox(height: 10),

          //* secound title
          Text(
            "You wan't to Delete $titlePage",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.black,
              fontSize: 20,
            ),
          ),

          SizedBox(height: 10),

          //* buttons
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 80),
                child: Button(
                  color: Colors.red,
                  text: "Delete",
                  onTap: () {
                    booksServices.deletePage(
                      bookIndex: bookIndex,
                      pageIndex: pageIndex,
                    );
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => HomePage(),
                      ),
                    );
                    refrech();
                    MySnackBar(
                      text: "Page Of ${books[bookIndex].name} is Deleted",
                      context: context,
                    );
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 80),
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
