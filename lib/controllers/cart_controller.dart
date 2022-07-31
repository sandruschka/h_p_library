import 'package:h_p_library/models/offer_model.dart';
import 'package:h_p_library/services/catalog_service.dart';
import 'package:injectable/injectable.dart';
import 'package:rxdart/subjects.dart';

@injectable
class CartController {
  final CatalogService catalogService;

  CartController(this.catalogService);

  final _offerSubject = BehaviorSubject<Offer?>();
  Stream<Offer?> get offer => _offerSubject.stream;

  void getOffers(List<String> isbn) {
    catalogService.getOffers(isbn.join(',')).then((offer) {
      _offerSubject.add(offer);
    }).catchError((error) {
      _offerSubject.addError(error);
    });
  }

  dispose() {
    _offerSubject.close();
  }
}
