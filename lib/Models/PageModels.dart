// ignore_for_file: public_member_api_docs, sort_constructors_first
class PageModels {
  final String title;
  final String content;
  final DateTime dateTime;

  PageModels({
    required this.title,
    required this.content,
    required this.dateTime,
  });

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'title': title,
      'content': content,
      'dateTime': dateTime.millisecondsSinceEpoch,
    };
  }

  factory PageModels.fromJson(Map<String, dynamic> json) {
    return PageModels(
      title: json['title'],
      content: json['content'],
      dateTime: DateTime.fromMillisecondsSinceEpoch(json['dateTime']),
    );
  }
}
