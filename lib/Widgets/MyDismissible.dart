// ignore_for_file: unnecessary_import, file_names, non_constant_identifier_names, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mybook_app/Data/DataBase.dart';
import 'package:mybook_app/Models/PageModels.dart';
import 'package:mybook_app/Services/BooksServices.dart';
import 'package:mybook_app/Widgets/MyAlertSheet.dart';

Dismissible MyDismissible({
  required BuildContext context,
  required int bookIndex,
  required int pageIndex,
  required Widget child,
  required VoidCallback refrech,
}) {
  BooksServices booksServices = BooksServices();
  return Dismissible(
    confirmDismiss: (direction) {
      return myAlertBSheet(context: context);
    },
    onDismissed: (direction) {
      booksServices.deletePage(bookIndex: bookIndex, pageIndex: pageIndex);
      refrech();
    },
    background: Container(
      decoration: BoxDecoration(
        color: Colors.red,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Icon(
        Icons.delete,
        color: Colors.white,
      ),
    ),
    key: ValueKey<PageModels>(books[bookIndex].pages[pageIndex]),
    child: child,
  );
}
