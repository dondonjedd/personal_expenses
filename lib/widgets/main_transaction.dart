import 'package:flutter/material.dart';
import 'package:personal_expenses/widgets/transaction_list.dart';
import '../models/transaction.dart';
import 'package:personal_expenses/widgets/add_transaction.dart';

class mainTransaction extends StatefulWidget {
  const mainTransaction({super.key});

  @override
  State<mainTransaction> createState() => _mainTransactionState();
}

class _mainTransactionState extends State<mainTransaction> {
  List<transaction> transactions = [
    transaction(
        id: '0', title: "shopping", amount: 30.59, date: DateTime.now()),
    transaction(id: '1', title: "futsal", amount: 15.99, date: DateTime.now()),
  ];

  _addNewTransaction(
    titleUser,
    amountUser,
  ) {
    final newTx = transaction(
        id: DateTime.now().toString(),
        title: titleUser,
        amount: amountUser,
        date: DateTime.now());

    setState(() {
      transactions.add(newTx);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      // ignore: prefer_const_literals_to_create_immutables
      children: <Widget>[
        const Card(
          color: Colors.blue,
          elevation: 5,
          child: Text("Chart"),
        ),
        addTransaction(_addNewTransaction),
        TransactionList(transactions),
      ],
    );
  }
}
