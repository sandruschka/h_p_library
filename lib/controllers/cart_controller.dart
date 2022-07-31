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
}
