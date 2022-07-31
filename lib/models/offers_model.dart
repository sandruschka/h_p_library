import 'package:h_p_library/models/offer_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'offers_model.g.dart';

@JsonSerializable()
class Offers {
  List<Offer>? offers;

  Offers({this.offers});

  factory Offers.fromJson(Map<String, dynamic> json) => _$OffersFromJson(json);
}
