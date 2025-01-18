// ignore_for_file: public_member_api_docs, sort_constructors_first, deprecated_member_use
import 'dart:convert';

import 'package:flutter/material.dart';

class Book {
  late final String name;
  final Color mainColor;
  final List<Page> pages;
  final DateTime bookTime;
  Book({
    required this.name,
    required this.mainColor,
    required this.pages,
    required this.bookTime,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'mainColor': mainColor.value,
      'pages': pages,
      'bookTime': bookTime,
    };
  }

  factory Book.fromMap(Map<String, dynamic> map) {
    return Book(
      name: map['name'] as String,
      mainColor: Color(map['mainColor'] as int),
      pages: List<Page>.from(
        (map['pages'] as List<Page>),
      ),
      bookTime: map['bookTime'] as DateTime,
    );
  }

  String toJson() => json.encode(toMap());

  factory Book.fromJson(String source) =>
      Book.fromMap(json.decode(source) as Map<String, dynamic>);
}
