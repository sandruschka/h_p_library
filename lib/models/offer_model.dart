import 'package:json_annotation/json_annotation.dart';

part 'offer_model.g.dart';

@JsonSerializable()
class Offer {
  List<Offer>? offers;
  String? type;
  String? sliceValue;
  String? value;

  Offer({
    this.offers,
    this.type,
    this.sliceValue,
    this.value,
  });

  factory Offer.fromJson(Map<String, dynamic> json) => _$OfferFromJson(json);
}
