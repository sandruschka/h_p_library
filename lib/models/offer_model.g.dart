// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'offer_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Offer _$OfferFromJson(Map<String, dynamic> json) => Offer(
      type: json['type'] as String?,
      sliceValue: json['sliceValue'] as int?,
      value: json['value'] as int?,
    );

Map<String, dynamic> _$OfferToJson(Offer instance) => <String, dynamic>{
      'type': instance.type,
      'sliceValue': instance.sliceValue,
      'value': instance.value,
    };
