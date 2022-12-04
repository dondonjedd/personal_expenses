import 'package:flutter/material.dart';
import 'package:personal_expenses/widgets/main_transaction.dart';
import 'package:personal_expenses/widgets/transaction_list.dart';
import 'models/transaction.dart';
import 'package:personal_expenses/widgets/add_transaction.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Personal Expenses',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Personal Expenses"),
        ),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: const <Widget>[
              Card(
                color: Colors.blue,
                elevation: 5,
                child: Text("Chart"),
              ),
              mainTransaction()
            ],
          ),
        ));
  }
}
