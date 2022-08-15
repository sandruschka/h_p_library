import 'package:badges/badges.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:h_p_library/models/cart_model.dart';
import 'package:h_p_library/views/cart_view.dart';
import 'package:h_p_library/views/catalog_view.dart';
import 'package:provider/provider.dart';

class MainApp extends StatefulWidget {
  const MainApp();

  @override
  State<StatefulWidget> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  int selectedIndex = 0;

  var pages = [CatalogView(), CartView()];

  @override
  Widget build(BuildContext context) {
    int nbBooksInCart = context.select<CartModel, int>(
      (cart) => cart.books.length,
    );

    return Scaffold(
      body: pages[selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedIndex,
        onTap: (int index) {
          setState(() {
            selectedIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: const Icon(Icons.store_mall_directory_outlined),
            activeIcon: const Icon(Icons.store),
            label: 'store'.tr(),
          ),
          BottomNavigationBarItem(
            activeIcon: const Icon(Icons.shopping_bag),
            icon: Badge(
              badgeColor: Theme.of(context).colorScheme.secondary,
              showBadge: nbBooksInCart > 0,
              badgeContent: Text('$nbBooksInCart'),
              animationType: BadgeAnimationType.scale,
              toAnimate: false,
              child: const Icon(Icons.shopping_bag_outlined),
            ),
            label: 'cart'.tr(),
          ),
        ],
      ),
    );
  }
}
