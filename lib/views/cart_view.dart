import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:h_p_library/controllers/cart_controller.dart';
import 'package:h_p_library/di/global_providers.dart';
import 'package:h_p_library/models/book_model.dart';
import 'package:h_p_library/models/cart_model.dart';
import 'package:h_p_library/models/offers_model.dart';
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
    List<Book> books = context.select<CartModel, List<Book>>(
      (cart) => cart.books,
    );

    if (books.isNotEmpty) {
      cartController.getOffers(books.map((e) => e.isbn).toList());
    }

    if (books.isEmpty) {
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
                    Book book = books[index];
                    return Card(
                      elevation: 2,
                      child: ListTile(
                        leading: CachedNetworkImage(imageUrl: book.cover ?? ''),
                        title: Text(book.title ?? ''),
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
                      ),
                    );
                  },
                  separatorBuilder: (context, index) => const SizedBox(
                    height: 4,
                  ),
                  itemCount: books.length,
                ),
              ),
              StreamBuilder<Offers?>(
                stream: cartController.offers,
                builder: (context, snapshot) {
                  Offers? offers = snapshot.data;
                  print("OFFERS");
                  print(offers);
                  print(offers?.offers);
                  if (snapshot.hasError) return Text("ERROR");
                  if (offers == null) {
                    return const SizedBox();
                  }
                  return AnimatedOpacity(
                    duration: const Duration(milliseconds: 500),
                    opacity: 1,
                    child: FractionallySizedBox(
                      widthFactor: 0.8,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text("TOTAL"),
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
