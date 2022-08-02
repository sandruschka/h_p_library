import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:h_p_library/controllers/cart_controller.dart';
import 'package:h_p_library/di/global_providers.dart';
import 'package:h_p_library/models/book_model.dart';
import 'package:h_p_library/models/cart_model.dart';
import 'package:h_p_library/models/offers_model.dart';
import 'package:h_p_library/styles/custom_theme.dart';
import 'package:h_p_library/widgets/atoms/priceText.dart';
import 'package:provider/provider.dart';

class CartView extends StatefulWidget {
  const CartView({Key? key}) : super(key: key);

  @override
  State<CartView> createState() => _CartViewState();
}

class _CartViewState extends State<CartView> {
  final CartController cartController = getIt<CartController>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final cart = context.watch<CartModel>();

    if (cart.books.isNotEmpty) {
      cartController.getOffers(cart.books.map((e) => e.isbn).toList());
    }

    if (cart.books.isEmpty) {
      return const Center();
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
                    Book book = cart.books[index];
                    return Card(
                      elevation: 2,
                      child: ListTile(
                        contentPadding: EdgeInsets.symmetric(
                          vertical: Spacing.px24,
                          horizontal: Spacing.px8,
                        ),
                        leading: CachedNetworkImage(imageUrl: book.cover ?? ''),
                        title: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(book.title ?? ''),
                            PriceText(price: book.price),
                          ],
                        ),
                        trailing: IconButton(
                          padding: EdgeInsets.zero,
                          icon: const Icon(Icons.close),
                          onPressed: () {},
                        ),
                      ),
                      /*trailing: Consumer<CartModel>(
                          builder: (context, cart, child) {
                            return IncrementCounter(
                              onIncrement: () {
                                cart.increaseAmount(book);
                              },
                              onDecrement: () {
                                if (book.amount > 0) cart.decreaseAmount(book);
                              },
                            );
                          },
                        ),*/
                    );
                  },
                  separatorBuilder: (context, index) => const SizedBox(
                    height: 4,
                  ),
                  itemCount: cart.books.length,
                ),
              ),
              AnimatedOpacity(
                duration: const Duration(seconds: 1),
                opacity: 1,
                child: FractionallySizedBox(
                  widthFactor: 0.8,
                  child: Container(
                    color: Theme.of(context).colorScheme.background,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('TOTAL'),
                        PriceText(price: cart.totalPrice),
                        StreamBuilder<Offers?>(
                          stream: cartController.offers,
                          builder: (context, snapshot) {
                            Offers? offers = snapshot.data;
                            cartController.calculateBestOffer(
                                offers?.offers, cart.totalPrice);
                            if (offers == null || snapshot.hasError) {
                              return const SizedBox();
                            }
                            return SizedBox();
                          },
                        )
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
