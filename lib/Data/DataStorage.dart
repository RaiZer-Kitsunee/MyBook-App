// ignore_for_file: avoid_print

import 'dart:convert';

import 'package:mybook_app/Data/DataBase.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DataStorage {
  //* store data with sheredPrefrences
  Future<void> saveDataInSP() async {
    SharedPreferences pref = await SharedPreferences.getInstance();

    List<Map<String, dynamic>> booksListString =
        books.map((e) => e.toJson()).toList();

    String booksString = jsonEncode(booksListString);

    pref.setString(booksKey, booksString);
    print("Save to Shared Prefrences Done");
  }
}
