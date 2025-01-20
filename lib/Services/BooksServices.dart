// ignore_for_file: file_names, avoid_print, non_constant_identifier_names

import 'package:mybook_app/Data/DataBase.dart';
import 'package:mybook_app/Data/DataStorage.dart';
import 'package:mybook_app/Models/BooksModels.dart';
import 'package:mybook_app/Models/PageModels.dart';

class BooksServices {
  DataStorage Storage = DataStorage();

  //* THE BOOKS PART
  //* add a book
  void addBook({required String name}) {
    books.add(BookModels(name: name, bookTime: DateTime.now(), pages: []));
    Storage.saveDataInSP();
    print("book added");
  }

  //* delete book
  void deleteBook({required int index}) {
    books.removeAt(index);
    Storage.saveDataInSP();
    print("book deleted");
  }

  //* maybe edit the name of the book
  void updateBook({required int index, required String newName}) {
    books[index].name = newName;
    Storage.saveDataInSP();
    print("book update");
  }

  //* THE PAGES PART
  //* add page
  void addPage(
      {required int bookIndex,
      required String title,
      required String content}) {
    books[bookIndex].pages.add(
        PageModels(title: title, content: content, dateTime: DateTime.now()));
    Storage.saveDataInSP();
    print("Page Added");
  }

  //* delete page
  void deletePage({required int bookIndex, required int pageIndex}) {
    books[bookIndex].pages.removeAt(pageIndex);
    Storage.saveDataInSP();
    print("Page removed Done");
  }

  //* update page
  void updatePage({
    required int bookIndex,
    required int pageIndex,
    required String newTitle,
    required String newContent,
  }) {
    books[bookIndex].pages.removeAt(pageIndex);
    books[bookIndex].pages.insert(
          pageIndex,
          PageModels(
            title: newTitle,
            content: newContent,
            dateTime: DateTime.now(),
          ),
        );
    Storage.saveDataInSP();
    print("Page Update Done");
  }
}
