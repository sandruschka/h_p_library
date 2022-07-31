import 'package:h_p_library/models/book_model.dart';
import 'package:h_p_library/models/offer_model.dart';
import 'package:h_p_library/services/catalog_service.dart';
import 'package:injectable/injectable.dart';
import 'package:rxdart/rxdart.dart';

@injectable
class CatalogController {
  final CatalogService catalogService;

  CatalogController(this.catalogService);

  final _booksSubject = BehaviorSubject<List<Book>?>();
  get books => _booksSubject.stream;

  final _offerSubject = BehaviorSubject<Offer>();
  get offer => _offerSubject.stream;

  void getCatalog() {
    catalogService.getCatalog().then((books) {
      _booksSubject.add(books);
    }).catchError((error) {
      _booksSubject.addError(error);
    });
  }

  dispose() {
    _booksSubject.close();
    _offerSubject.close();
  }
}
