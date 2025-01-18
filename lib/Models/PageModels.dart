import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class Page {
  final String title;
  final String content;
  final DateTime dateTime;

  Page({
    required this.title,
    required this.content,
    required this.dateTime,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'title': title,
      'content': content,
      'dateTime': dateTime.millisecondsSinceEpoch,
    };
  }

  factory Page.fromMap(Map<String, dynamic> map) {
    return Page(
      title: map['title'] as String,
      content: map['content'] as String,
      dateTime: DateTime.fromMillisecondsSinceEpoch(map['dateTime'] as int),
    );
  }

  String toJson() => json.encode(toMap());

  factory Page.fromJson(String source) =>
      Page.fromMap(json.decode(source) as Map<String, dynamic>);
}
