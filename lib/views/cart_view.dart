import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:h_p_library/controllers/cart_controller.dart';
import 'package:h_p_library/di/global_providers.dart';
import 'package:h_p_library/models/book_model.dart';
import 'package:h_p_library/models/cart_model.dart';
import 'package:h_p_library/models/offers_model.dart';
import 'package:h_p_library/styles/custom_theme.dart';
import 'package:h_p_library/widgets/atoms/priceText.dart';
import 'package:provider/provider.dart';

class CartView extends StatelessWidget {
  final CartController cartController = getIt<CartController>();

  @override
  Widget build(BuildContext context) {
    final cart = context.watch<CartModel>();

    if (cart.books.isNotEmpty) {
      cartController.getOffers(cart.books.map((e) => e.isbn).toList());
    }

    if (cart.books.isEmpty) {
      return Center(
        child: Column(
          children: [
            const Spacer(flex: 2),
            SvgPicture.asset(
              'assets/images/gone_shopping.svg',
              semanticsLabel: 'No items in shopping bag image',
            ),
            Text(
              'Lets go do some shopping!',
              style: Theme.of(context).textTheme.headline5,
            ),
            const Spacer(),
          ],
        ),
      );
    }
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Cart View'),
          automaticallyImplyLeading: false,
        ),
        backgroundColor: Theme.of(context).colorScheme.background,
        body: Padding(
          padding: EdgeInsets.only(
              top: Spacing.px8,
              left: Spacing.px8,
              right: Spacing.px8,
              bottom: 50),
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
                          onPressed: () {
                            cart.remove(book);
                          },
                        ),
                      ),
                    );
                  },
                  separatorBuilder: (context, index) => const SizedBox(
                    height: 4,
                  ),
                  itemCount: cart.books.length,
                ),
              ),
              SizedBox(height: Spacing.px24),
              Container(
                width: double.infinity,
                color: Colors.white,
                padding: EdgeInsets.all(Spacing.px16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('TOTAL'),
                    Divider(color: Theme.of(context).colorScheme.secondary),
                    StreamBuilder<Offers?>(
                      stream: cartController.offers,
                      builder: (context, snapshot) {
                        Offers? offers = snapshot.data;
                        double bestOffer = cartController.calculateBestOffer(
                            offers?.offers, cart.totalPrice);
                        if (offers == null || snapshot.hasError) {
                          return const SizedBox();
                        }
                        return Row(
                          children: [
                            PriceText(price: bestOffer),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                vertical: Spacing.px8,
                                horizontal: Spacing.px8,
                              ),
                              child: PriceText(
                                price: cart.totalPrice,
                                isLineThrough: true,
                              ),
                            ),
                          ],
                        );
                      },
                    ),
                    ElevatedButton(
                      onPressed: () {
                        ScaffoldMessenger.of(context)
                            .showSnackBar(const SnackBar(
                          content: const Text('Currently not available'),
                        ));
                      },
                      child: const Text('Go to checkout'),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
