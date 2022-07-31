import 'package:badges/badges.dart';
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

  var pages = [const CatalogView(), const CartView()];

  @override
  Widget build(BuildContext context) {
    int nbBooksInCart = context.select<CartModel, int>(
      (cart) => cart.books.length,
    );

    return Scaffold(
      body: pages[selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.pink,
        currentIndex: selectedIndex,
        onTap: (int index) {
          setState(() {
            selectedIndex = index;
          });
        },
        items: [
          const BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined, color: Colors.black),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Badge(
              showBadge: nbBooksInCart > 0,
              badgeContent: Text('$nbBooksInCart'),
              animationType: BadgeAnimationType.scale,
              child: const Icon(Icons.shopping_cart_outlined),
            ),
            label: 'Cart',
          ),
        ],
      ),
    );
  }
}
