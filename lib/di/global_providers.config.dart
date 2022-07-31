// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i4;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../controllers/cart_controller.dart' as _i6;
import '../controllers/catalog_controller.dart' as _i7;
import '../services/catalog_service.dart' as _i5;
import '../services/custom_dio.dart'
    as _i3; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  final serviceModule = _$ServiceModule();
  gh.lazySingleton<_i3.CustomDio>(() => _i3.CustomDio());
  gh.singleton<_i4.Dio>(serviceModule.dio);
  gh.factory<_i5.CatalogService>(() => _i5.CatalogService(get<_i4.Dio>()));
  gh.factory<_i6.CartController>(
      () => _i6.CartController(get<_i5.CatalogService>()));
  gh.factory<_i7.CatalogController>(
      () => _i7.CatalogController(get<_i5.CatalogService>()));
  return get;
}

class _$ServiceModule extends _i5.ServiceModule {}
