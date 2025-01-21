// ignore_for_file: public_member_api_docs, sort_constructors_first, deprecated_member_use, file_names

import 'package:mybook_app/Models/PageModels.dart';

class BookModels {
  String name;
  final List<dynamic> pages;
  final DateTime bookTime;

  BookModels({
    required this.name,
    required this.pages,
    required this.bookTime,
  });

  Map<String, dynamic> toJson() => {
        'name': name,
        'pages': pages.map((e) => e.toJson()).toList(),
        'bookTime': bookTime.millisecondsSinceEpoch,
      };

  factory BookModels.fromJson(Map<String, dynamic> json) {
    return BookModels(
      name: json["name"],
      pages: json["pages"].map((e) => PageModels.fromJson(e)).toList(),
      bookTime: DateTime.fromMillisecondsSinceEpoch(json["bookTime"]),
    );
  }
}
