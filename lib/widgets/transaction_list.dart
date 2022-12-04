import 'package:flutter/material.dart';
import '../models/transaction.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  final List<transaction> transactions;

  const TransactionList(this.transactions, {super.key});
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: SingleChildScrollView(
        child: Column(
            children: transactions.map((tx) {
          return Card(
              child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                  margin: const EdgeInsets.symmetric(
                    vertical: 10,
                    horizontal: 15,
                  ),
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.purple, width: 2)),
                  padding: const EdgeInsets.all(10),
                  child: Text(
                    "RM${tx.amount}",
                    style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Colors.purple),
                  )),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    tx.title,
                    style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    DateFormat.yMMMd().format(tx.date),
                    style: const TextStyle(fontSize: 12, color: Colors.grey),
                  )
                ],
              )
            ],
          ));
        }).toList()),
      ),
    );
  }
}