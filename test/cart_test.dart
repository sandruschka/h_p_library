import 'dart:convert';

import 'package:h_p_library/controllers/cart_controller.dart';
import 'package:h_p_library/models/offers_model.dart';
import 'package:h_p_library/services/catalog_service.dart';
import 'package:h_p_library/services/custom_dio.dart';
import 'package:test/test.dart';

void main() {
  CartController cartController =
      CartController(CatalogService(CustomDio().getApiDio()));
  late Offers offers;

  group('Calculate Offers', () {
    test('Calculate best offer if minus', () {
      Map<String, dynamic> bestOfferIsMinus = jsonDecode(
          '{"offers":[{"type":"percentage","value":5},{"type":"minus","value":15},{"type":"slice","sliceValue":100,"value":12}]}');
      offers = Offers.fromJson(bestOfferIsMinus);
      double bestOffer = cartController.calculateBestOffer(offers.offers, 40);
      expect(bestOffer, 25);
    });

    test('Calculate best offer if minus', () {
      Map<String, dynamic> bestOfferIsSlice = jsonDecode(
          '{"offers":[{"type":"percentage","value":5},{"type":"minus","value":15},{"type":"slice","sliceValue":100,"value":40}]}');
      offers = Offers.fromJson(bestOfferIsSlice);
      double bestOffer = cartController.calculateBestOffer(offers.offers, 100);
      expect(bestOffer, 60);
    });
    test('Calculate best offer if minus', () {
      Map<String, dynamic> bestOfferIsPercentage = jsonDecode(
          '{"offers":[{"type":"percentage","value":50},{"type":"minus","value":15},{"type":"slice","sliceValue":100,"value":12}]}');
      offers = Offers.fromJson(bestOfferIsPercentage);
      double bestOffer = cartController.calculateBestOffer(offers.offers, 100);
      expect(bestOffer, 50);
    });
  });
}
