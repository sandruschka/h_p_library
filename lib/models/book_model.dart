import 'package:json_annotation/json_annotation.dart';

part 'book_model.g.dart';

@JsonSerializable()
class Book {
  String? isbn;
  String? title;
  int? price;
  String? cover;
  List<String>? synopsis;
  int amount;

  Book({
    this.isbn,
    this.title,
    this.price,
    this.cover,
    this.synopsis,
    this.amount = 0,
  });

  factory Book.fromJson(Map<String, dynamic> json) => _$BookFromJson(json);
}
