import 'package:flutter/cupertino.dart';
import 'package:h_p_library/views/cart_view.dart';
import 'package:h_p_library/views/catalog_view.dart';

enum RouteNames { catalog, cart, book }

Map<String, Widget Function(BuildContext)> appRoutes = {
  '/${RouteNames.catalog.name}': (context) => CatalogView(),
  '/${RouteNames.cart.name}': (context) => const CartView(),
  '/${RouteNames.book.name}/id': (context) => const SizedBox(),
};
