import 'package:json_annotation/json_annotation.dart';

part 'offer_model.g.dart';

@JsonSerializable()
class Offer {
  String? type;
  String? sliceValue;
  int? value;

  Offer({
    this.type,
    this.sliceValue,
    this.value,
  });

  factory Offer.fromJson(Map<String, dynamic> json) => _$OfferFromJson(json);
}
