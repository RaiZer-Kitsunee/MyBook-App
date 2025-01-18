import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class Page {
  final String title;
  final String note;
  final DateTime dateTime;
  final int pageNum;

  Page({
    required this.title,
    required this.note,
    required this.dateTime,
    required this.pageNum,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'title': title,
      'note': note,
      'dateTime': dateTime.millisecondsSinceEpoch,
      'pageNum': pageNum,
    };
  }

  factory Page.fromMap(Map<String, dynamic> map) {
    return Page(
      title: map['title'] as String,
      note: map['note'] as String,
      dateTime: DateTime.fromMillisecondsSinceEpoch(map['dateTime'] as int),
      pageNum: map['pageNum'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory Page.fromJson(String source) =>
      Page.fromMap(json.decode(source) as Map<String, dynamic>);
}
