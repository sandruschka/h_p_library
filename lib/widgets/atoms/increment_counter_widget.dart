import 'package:flutter/material.dart';

class IncrementCounter extends StatelessWidget {
  final Function onIncrement;
  final Function onDecrement;

  const IncrementCounter({
    Key? key,
    required this.onIncrement,
    required this.onDecrement,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(3),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5), color: Colors.red),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          InkWell(
              onTap: () {},
              child: const Icon(
                Icons.remove,
                color: Colors.white,
                size: 24,
              )),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 3),
            padding: const EdgeInsets.symmetric(horizontal: 3, vertical: 2),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(3), color: Colors.white),
            child: const Text(
              '3',
              style: TextStyle(color: Colors.black, fontSize: 16),
            ),
          ),
          InkWell(
            onTap: () {},
            child: const Icon(
              Icons.add,
              color: Colors.white,
              size: 16,
            ),
          ),
        ],
      ),
    );
  }
}
