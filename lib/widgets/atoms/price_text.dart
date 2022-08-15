import 'package:flutter/material.dart';

class PriceText extends StatelessWidget {
  final num? price;
  final bool isLineThrough;
  const PriceText({
    Key? key,
    required this.price,
    this.isLineThrough = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    String? priceAsExponential = price?.toDouble().toStringAsFixed(2);

    return Text(
      priceAsExponential != null ? '$priceAsExponential€' : 'price unavailable',
      style: theme.textTheme.bodyText1
          ?.copyWith(
              color: isLineThrough
                  ? Colors.black.withOpacity(0.6)
                  : theme.colorScheme.error)
          .copyWith(
            decoration: isLineThrough ? TextDecoration.lineThrough : null,
          ),
    );
  }
}
