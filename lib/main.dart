import 'package:flutter/material.dart';
import 'transaction.dart';

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
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  List<transaction> transactions = [
    transaction(id: 0, title: "shopping", amount: 30, date: DateTime.now()),
    transaction(id: 1, title: "futsal", amount: 15, date: DateTime.now()),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Personal Expenses"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        // ignore: prefer_const_literals_to_create_immutables
        children: <Widget>[
          const Card(
            color: Colors.blue,
            elevation: 5,
            child: Text("Chart"),
          ),
          Column(
              children: transactions.map((tx) {
            return Card(child: Text(tx.title));
          }).toList())
        ],
      ),
    );
  }
}
