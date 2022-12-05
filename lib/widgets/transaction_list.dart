import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
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
                // return Slidable(
                //   direction: Axis.horizontal,
                //   closeOnScroll: true,
                //   endActionPane: const ActionPane(
                //     extentRatio: 0.2,
                //     motion: ScrollMotion(),
                //     children: [
                //       SlidableAction(
                //         borderRadius: BorderRadius.all(Radius.circular(10)),
                //         onPressed: null,
                //         backgroundColor: Color(0xFFFE4A49),
                //         foregroundColor: Colors.white,
                //         icon: Icons.delete,
                //         label: 'Delete',
                //       ),
                //     ],
                //   ),
                // child:
                return Card(
                  elevation: 5,
                  margin:
                      const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                  child: Slidable(
                    direction: Axis.horizontal,
                    closeOnScroll: true,
                    endActionPane: const ActionPane(
                      extentRatio: 0.2,
                      motion: ScrollMotion(),
                      children: [
                        SlidableAction(
                          onPressed: null,
                          backgroundColor: Color(0xFFFE4A49),
                          foregroundColor: Colors.white,
                          icon: Icons.delete,
                          label: 'Delete',
                        ),
                      ],
                    ),
                    child: ListTile(
                      leading: CircleAvatar(
                          backgroundColor:
                              Theme.of(context).colorScheme.primary,
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
                        style:
                            const TextStyle(fontSize: 12, color: Colors.grey),
                      ),
                      // trailing: const IconButton(
                      //     icon: Icon(Icons.delete), onPressed: null),
                    ),
                  ), //to add slidable
                );
              },
              itemCount: transactions.length,
            ),
    );
  }
}
