import 'package:h_p_library/models/offer_model.dart';
import 'package:h_p_library/models/offers_model.dart';
import 'package:h_p_library/services/catalog_service.dart';
import 'package:injectable/injectable.dart';
import 'package:rxdart/subjects.dart';

@injectable
class CartController {
  final CatalogService catalogService;

  CartController(this.catalogService);

  final _offersSubject = BehaviorSubject<Offers?>();
  Stream<Offers?> get offers => _offersSubject.stream;

  void getOffers(List<String?>? isbn) {
    if (isbn == null) return;
    catalogService.getOffers(isbn.join(',')).then((offers) {
      _offersSubject.add(offers);
    }).catchError((error) {
      _offersSubject.addError(error);
    });
  }

  dispose() {
    _offersSubject.close();
  }

  double calculateBestOffer(List<Offer>? offers, int totalPrice) {
    double bestOffer = totalPrice.toDouble();

    Map<String, double Function(Offer)> offersCalculationMap = {
      'percentage': (Offer offer) {
        if (offer.value == null || offer.value == 0) return 0;
        double reducedPrice = totalPrice.toDouble();
        double reduction = totalPrice * (offer.value! / 100).toDouble();
        reducedPrice -= reduction;
        return reducedPrice;
      },
      'minus': (Offer offer) {
        if (offer.value == null || offer.value == 0) return 0;
        double reducedPrice = (totalPrice - offer.value!).toDouble();
        return reducedPrice;
      },
      'slice': (Offer offer) {
        if (offer.value == null || offer.value == 0) return 0;
        int nbSlice = totalPrice ~/ 100;
        double reducedPrice =
            (totalPrice - (offer.value! * nbSlice)).toDouble();
        return reducedPrice;
      }
    };

    offers?.forEach((element) {
      if (offersCalculationMap.keys.contains(element.type)) {
        double reducedPrice = offersCalculationMap[element.type]!(element);
        if (reducedPrice < bestOffer) bestOffer = reducedPrice;
      }
    });
    return bestOffer;
  }
}
