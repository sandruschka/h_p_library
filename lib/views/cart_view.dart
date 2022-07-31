import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:h_p_library/controllers/catalog_controller.dart';
import 'package:h_p_library/di/global_providers.dart';
import 'package:h_p_library/models/book_model.dart';
import 'package:h_p_library/models/cart_model.dart';
import 'package:h_p_library/models/offer_model.dart';
import 'package:h_p_library/widgets/atoms/increment_counter_widget.dart';
import 'package:provider/provider.dart';
import 'package:rive/rive.dart';

class CartView extends StatefulWidget {
  const CartView({Key? key}) : super(key: key);

  @override
  State<CartView> createState() => _CartViewState();
}

class _CartViewState extends State<CartView> {
  final CatalogController catalogController = getIt<CatalogController>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List<Book> books = context.select<CartModel, List<Book>>(
      (cart) => cart.books,
    );

    catalogController.getOffers(books.map((e) => e.isbn).toList());

    if (books.length == 0) {
      return Center(
        child: RiveAnimation.network(
          'https://cdn.rive.app/animations/vehicles.riv',
        ),
      );
    }
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Cart View'),
          automaticallyImplyLeading: false,
        ),
        body: Padding(
          padding: const EdgeInsets.only(top: 4, left: 4, right: 4, bottom: 50),
          child: Column(
            children: [
              Expanded(
                child: ListView.separated(
                  itemBuilder: (context, index) {
                    return Card(
                      elevation: 2,
                      child: ListTile(
                        leading: CachedNetworkImage(
                            imageUrl: books[index].cover ?? ''),
                        title: Text(books[index].title ?? ''),
                        trailing: IncrementCounter(
                          onIncrement: () {},
                          onDecrement: () {},
                        ),
                      ),
                    );
                  },
                  separatorBuilder: (context, index) => const SizedBox(
                    height: 4,
                  ),
                  itemCount: books.length,
                ),
              ),
              StreamBuilder<Offer?>(
                stream: catalogController.offer,
                builder: (context, snapshot) {
                  Offer? offer = snapshot.data;
                  if (offer == null) {
                    return const SizedBox();
                  }
                  return AnimatedOpacity(
                    duration: const Duration(milliseconds: 500),
                    opacity: offer == null ? 0 : 1,
                    child: FractionallySizedBox(
                      widthFactor: 0.8,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("TOTAL"),
                        ],
                      ),
                    ),
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
