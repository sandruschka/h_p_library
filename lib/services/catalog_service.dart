import 'package:dio/dio.dart';
import 'package:h_p_library/di/global_providers.dart';
import 'package:h_p_library/models/book_model.dart';
import 'package:h_p_library/models/offer_model.dart';
import 'package:h_p_library/services/custom_dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/http.dart';

part 'catalog_service.g.dart';

@module
abstract class ServiceModule {
  @singleton
  Dio get dio => getIt<CustomDio>().getApiDio();
}

@RestApi()
@injectable
abstract class CatalogService {
  @factoryMethod
  factory CatalogService(Dio dio) = _CatalogService;

  @GET('/books')
  Future<List<Book>> getCatalog();

  @GET('/books/{isbn}/commercialOffers')
  Future<Offer> getOffers(@Path() String isbn);
}
