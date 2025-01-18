// ignore_for_file: file_names, avoid_print

import 'dart:ui';

import 'package:mybook_app/Data/DataBase.dart';
import 'package:mybook_app/Models/BooksModels.dart';
import 'package:mybook_app/Models/PageModels.dart';

class BooksServices {
  //* THE BOOKS PART
  //* add a book
  void addBook({required String name, required Color mainColor}) {
    books.add(
      Book(
          name: name,
          mainColor: mainColor,
          bookTime: DateTime.now(),
          pages: []),
    );
    print("book added");
  }

  //* delete book
  void deleteBook({required int index}) {
    books.removeAt(index);
    print("book deleted");
  }

  //* maybe edit the name of the book
  void updateBook({required int index, required String newName}) {
    books[index].name = newName;
    print("book update");
  }

  //* THE PAGES PART
  //* add page
  void addPage(
      {required int bookIndex,
      required String title,
      required String content}) {
    books[bookIndex].pages.add(
          Page(
            title: title,
            content: content,
            dateTime: DateTime.now(),
          ),
        );
    print("Page Added");
  }

  //* delete page

  //* update page
}
