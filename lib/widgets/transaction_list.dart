import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<transaction> transactions;

  const TransactionList(this.transactions, {super.key});
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 370,
      child: transactions.isEmpty
          ? Column(
              children: [
                Text(
                  "No Transactions Available",
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                const SizedBox(height: 10),
                SizedBox(
                  height: 400,
                  child: Image.asset(
                    "assets/images/cat_waiting.jpg",
                    fit: BoxFit.cover,
                  ),
                )
              ],
            )
          : ListView.builder(
              itemBuilder: (ctx, index) {
                return Card(
                  elevation: 5,
                  margin:
                      const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                  child: ListTile(
                    leading: CircleAvatar(
                        backgroundColor: Theme.of(context).colorScheme.primary,
                        radius: 30,
                        child: Padding(
                          padding: const EdgeInsets.all(6.0),
                          child: FittedBox(
                            child: Text(
                                "RM${transactions[index].amount.toStringAsFixed(2)}"),
                          ),
                        )),
                    title: Text(transactions[index].title,
                        style: Theme.of(context).textTheme.titleLarge),
                    subtitle: Text(
                      DateFormat.yMMMd().format(transactions[index].date),
                      style: const TextStyle(fontSize: 12, color: Colors.grey),
                    ),
                  ),
                  //     child: Row(
                  //   mainAxisAlignment: MainAxisAlignment.start,
                  //   children: [
                  //     Container(
                  //         margin: const EdgeInsets.symmetric(
                  //           vertical: 10,
                  //           horizontal: 15,
                  //         ),
                  //         decoration: BoxDecoration(
                  //             border: Border.all(
                  //                 color: Theme.of(context).colorScheme.primary,
                  //                 width: 2)),
                  //         padding: const EdgeInsets.all(10),
                  //         child: Text(
                  //           "RM${transactions[index].amount.toStringAsFixed(2)}",
                  //           style: TextStyle(
                  //               fontWeight: FontWeight.bold,
                  //               fontSize: 20,
                  //               color: Theme.of(context).colorScheme.primary),
                  //         )),
                  //     Column(
                  //       crossAxisAlignment: CrossAxisAlignment.start,
                  //       children: [
                  //         Text(transactions[index].title,
                  //             style: Theme.of(context).textTheme.titleLarge),
                  //         Text(
                  //           DateFormat.yMMMd().format(transactions[index].date),
                  //           style:
                  //               const TextStyle(fontSize: 12, color: Colors.grey),
                  //         )
                  //       ],
                  //     )
                  //   ],
                  // )
                );
              },
              itemCount: transactions.length,
            ),
    );
  }
}
