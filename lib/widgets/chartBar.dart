import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget {
  final Map<String, Object> tx;
  const ChartBar(this.tx, {super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        FittedBox(
            child: Text("RM${(tx["amount"] as double).toStringAsFixed(0)}")),
        SizedBox(
          height: 80,
          width: 10,
          child: Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                    color: Colors.grey,
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(10)),
              ),
              FractionallySizedBox(
                heightFactor: tx["percentage"] as double <= 0
                    ? 0
                    : tx["percentage"] as double,
                child: Container(
                  decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.secondary,
                      border: Border.all(
                          color: Theme.of(context).colorScheme.secondary),
                      borderRadius: BorderRadius.circular(10)),
                ),
              )
            ],
          ),
        ),
        Text(tx["day"] as String),
      ],
    );
  }
}
