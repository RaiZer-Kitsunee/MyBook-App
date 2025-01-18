// ignore_for_file: prefer_const_constructors, file_names

import 'package:flutter/material.dart';
import 'package:mybook_app/Data/DataBase.dart';
import 'package:mybook_app/Widgets/PagesSheet/addPageScreen.dart';

FloatingActionButton myFloatingActionButton({
  required BuildContext context,
  required int bookIndex,
  required TextEditingController titleController,
  required TextEditingController contentController,
  required void Function() refrech,
}) {
  return FloatingActionButton(
    onPressed: () => Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => AddPageScreen(
          bookIndex: bookIndex,
          refrech: refrech,
          titleController: titleController,
          contentController: contentController,
        ),
      ),
    ),
    shape: CircleBorder(),
    backgroundColor: books[bookIndex].mainColor,
    child: Icon(
      Icons.add,
      size: 30,
      color: Colors.black,
    ),
  );
}
