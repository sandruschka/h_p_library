import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:h_p_library/models/book_model.dart';
import 'package:h_p_library/models/cart_model.dart';
import 'package:provider/provider.dart';

class CatalogCard extends StatelessWidget {
  final Book book;

  const CatalogCard({Key? key, required this.book}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(8)),
      ),
      child: Row(
        children: [
          Container(
            height: 200,
            padding: const EdgeInsets.all(4),
            child: CachedNetworkImage(imageUrl: book.cover ?? ''),
          ),
          Flexible(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Text(book.title ?? ''),
                Text(
                  book.synopsis?.first ?? '',
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  '${book.price}',
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                )
              ],
            ),
          ),
          Consumer<CartModel>(builder: (context, cart, child) {
            bool isInCart = cart.books.contains(book);
            return IconButton(
              onPressed: () {
                if (isInCart) {
                  cart.remove(book);
                } else {
                  cart.add(book);
                }
              },
              icon: Icon(
                isInCart ? Icons.shopping_cart : Icons.shopping_cart_outlined,
                color: isInCart ? Colors.black : Colors.green,
              ),
            );
          }),
        ],
      ),
    );
  }
}
