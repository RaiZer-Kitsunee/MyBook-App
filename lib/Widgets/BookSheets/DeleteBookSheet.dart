// ignore_for_file: prefer_const_constructors, non_constant_identifier_names, file_names

import 'package:flutter/material.dart';
import 'package:mybook_app/Data/DataBase.dart';
import 'package:mybook_app/Screens/Main/HomePage.dart';
import 'package:mybook_app/Services/BooksServices.dart';
import 'package:mybook_app/Widgets/MySnackBar.dart';

void DeleteBookSheet(
  BuildContext context,
  int bookIndex,
  String bookName,
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
          //* secound title
          Text(
            "You wan't to Delete $bookName",
            style: TextStyle(
              color: Color(0xFF5D4C46),
              fontSize: 25,
              fontStyle: FontStyle.italic,
            ),
          ),

          SizedBox(height: 10),

          //* buttons
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              //* delete button
              Button(
                color: Colors.red,
                text: "Delete",
                onTap: () {
                  booksServices.deleteBook(index: bookIndex);
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => HomePage(),
                    ),
                  );
                  refrech();
                  MySnackBar(
                      text: "${books[bookIndex].name} Deleted",
                      context: context);
                },
              ),

              //* divider
              Divider(
                color: Colors.black,
                height: 10,
                endIndent: 80,
                indent: 80,
              ),

              //* cancel button
              Button(
                text: "Cancel",
                color: Color(0xFF5D4C46),
                onTap: () => Navigator.pop(context),
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
      margin: EdgeInsets.all(5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Text(
        text,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          color: color,
          fontSize: 20,
        ),
      ),
    ),
  );
}
