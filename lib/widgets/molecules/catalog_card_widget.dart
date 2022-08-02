import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:h_p_library/models/book_model.dart';
import 'package:h_p_library/models/cart_model.dart';
import 'package:h_p_library/styles/custom_theme.dart';
import 'package:h_p_library/widgets/atoms/priceText.dart';
import 'package:h_p_library/widgets/molecules/book_description_sheet_widget.dart';
import 'package:provider/provider.dart';

class CatalogCard extends StatelessWidget {
  final Book book;

  const CatalogCard({
    Key? key,
    required this.book,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showModalBottomSheet(
          context: context,
          useRootNavigator: false,
          builder: (context) {
            return BookDescriptionSheet(book: book);
          },
        );
      },
      child: Card(
        elevation: 3,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(8)),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Expanded(
              flex: 2,
              child: CachedNetworkImage(imageUrl: book.cover ?? ''),
            ),
            Expanded(
              flex: 4,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: Spacing.px16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      book.title ?? '',
                      style: Theme.of(context).textTheme.headline6,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: Spacing.px16),
                      child: Text(
                        book.synopsis?.first ?? '',
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        PriceText(price: book.price),
                        Consumer<CartModel>(
                          builder: (context, cart, child) {
                            bool isInCart = cart.books.contains(book);
                            return IconButton(
                              padding: EdgeInsets.zero,
                              onPressed: () {
                                if (isInCart) {
                                  cart.remove(book);
                                } else {
                                  cart.add(book);
                                }
                              },
                              icon: Icon(
                                isInCart
                                    ? Icons.shopping_bag_rounded
                                    : Icons.shopping_bag_outlined,
                                color: Colors.black,
                              ),
                            );
                          },
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
