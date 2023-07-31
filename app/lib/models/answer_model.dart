import './selection_model.dart';

class Answer {
  static int maxOrder = 1024;

  final String? id;
  final String? text;
  final int? order;
  List<Selection> selections;

  Answer({
    this.id = '',
    this.text,
    this.order,
    this.selections = const [],
  });

  factory Answer.fromJson(Map<String, dynamic> json) => Answer(
        id: json["id"],
        text: json["text"],
        order: json["order"] ?? Answer.maxOrder,
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "text": text,
        "order": order,
      };
}
