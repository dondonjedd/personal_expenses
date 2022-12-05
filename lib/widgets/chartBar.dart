import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget {
  final Map<String, Object> tx;
  const ChartBar(this.tx, {super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(tx["amount"].toString()),
        Stack(
          children: [
            Container(
              height: 80,
              width: 10,
              color: Colors.grey,
            ),
            Container(
              margin: const EdgeInsets.only(top: 80 - 30),
              height: 30,
              width: 10,
              color: Theme.of(context).colorScheme.secondary,
            )
          ],
        ),
        Text(tx["day"] as String),
      ],
    );
  }
}
