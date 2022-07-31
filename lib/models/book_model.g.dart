// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'book_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Book _$BookFromJson(Map<String, dynamic> json) => Book(
      isbn: json['isbn'] as String?,
      title: json['title'] as String?,
      price: json['price'] as int?,
      cover: json['cover'] as String?,
      synopsis: (json['synopsis'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      amount: json['amount'] as int? ?? 0,
    );

Map<String, dynamic> _$BookToJson(Book instance) => <String, dynamic>{
      'isbn': instance.isbn,
      'title': instance.title,
      'price': instance.price,
      'cover': instance.cover,
      'synopsis': instance.synopsis,
      'amount': instance.amount,
    };
