import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class PriceText extends StatelessWidget {
  final int? price;
  const PriceText({Key? key, required this.price}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    String? priceAsExponential = price?.toDouble().toStringAsFixed(2);

    return Text(
      priceAsExponential != null
          ? '$priceAsExponential  €'
          : 'price unavailable',
      style:
          theme.textTheme.bodyText1?.copyWith(color: theme.colorScheme.error),
    );
  }
}
