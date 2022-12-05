import 'package:flutter/material.dart';
import 'package:personal_expenses/widgets/add_transaction.dart';
import 'package:personal_expenses/widgets/chart.dart';
import 'package:personal_expenses/widgets/transaction_list.dart';
import './models/transaction.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Personal Expenses',
      theme: ThemeData(
          colorScheme: ColorScheme.fromSwatch(
            primarySwatch: Colors.green,
            accentColor: Colors.brown,
          ),
          // fontFamily: "QuickSand",
          textTheme: ThemeData.light().textTheme.copyWith(
              titleLarge: const TextStyle(
                  fontFamily: 'OpenSans',
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold)),
          appBarTheme: ThemeData.light().appBarTheme.copyWith(
              titleTextStyle: const TextStyle(
                  fontFamily: 'OpenSans',
                  fontSize: 20,
                  fontWeight: FontWeight.bold))),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<transaction> transactions = [
    transaction(
        id: '0', title: "shopping", amount: 30.59, date: DateTime.now()),
    transaction(id: '1', title: "futsal", amount: 15.99, date: DateTime.now()),
    transaction(
        id: '1',
        title: "futsal",
        amount: 30.99,
        date: DateTime.now().subtract(const Duration(days: 1))),
    transaction(
        id: '1',
        title: "futsal",
        amount: 5.99,
        date: DateTime.now().subtract(const Duration(days: 2))),
    // transaction(id: '1', title: "futsal", amount: 15.99, date: DateTime.now()),
    // transaction(id: '1', title: "futsal", amount: 15.99, date: DateTime.now()),
    // transaction(id: '1', title: "futsal", amount: 15.99, date: DateTime.now()),
    // transaction(id: '1', title: "futsal", amount: 15.99, date: DateTime.now()),
    // transaction(id: '1', title: "futsal", amount: 15.99, date: DateTime.now()),
  ];

  _addNewTransaction(titleUser, amountUser, dateUser) {
    final newTx = transaction(
        id: DateTime.now().toString(),
        title: titleUser,
        amount: amountUser,
        date: dateUser);

    setState(() {
      transactions.add(newTx);
    });
  }

  startAddTranscationBottomSheet(ctx) {
    showModalBottomSheet(
        context: ctx,
        builder: (_) {
          return AddTransaction(_addNewTransaction);
        });
  }

  List<transaction> recentTransactions() {
    return transactions
        .where((element) => element.date
            .isAfter(DateTime.now().subtract(const Duration(days: 7))))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Personal Expenses"),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () => startAddTranscationBottomSheet(context),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Chart(recentTransactions()),
            TransactionList(transactions),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => startAddTranscationBottomSheet(context),
        child: const Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
