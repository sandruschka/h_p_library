import 'package:flutter/material.dart';
import 'package:h_p_library/models/book_model.dart';
import 'package:h_p_library/styles/custom_theme.dart';

class BookDescriptionSheet extends StatelessWidget {
  final Book book;

  const BookDescriptionSheet({Key? key, required this.book}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableActuator(
      child: DraggableScrollableSheet(
        expand: false,
        builder: (BuildContext context, ScrollController scrollController) {
          return Container(
            color: Colors.white,
            padding: EdgeInsets.symmetric(
              horizontal: Spacing.px16,
              vertical: Spacing.px28,
            ),
            child: Column(
              children: [
                Expanded(
                  child: CustomScrollView(
                    controller: scrollController,
                    slivers: [
                      SliverToBoxAdapter(
                        child: Text(
                          'Synopsis',
                          style: Theme.of(context).textTheme.headline6,
                        ),
                      ),
                      SliverPadding(
                          padding: EdgeInsets.only(top: Spacing.px16)),
                      SliverToBoxAdapter(
                        child: Text(
                          book.synopsis?.first ?? '',
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
