import 'package:flutter/material.dart';
import 'package:personal_expenses/widgets/chartBar.dart';
import '../models/transaction.dart';
import 'package:intl/intl.dart';

class Chart extends StatelessWidget {
  final List<transaction> recentTransactions;

  const Chart(this.recentTransactions, {super.key});

  double totalPreviousWeek() {
    return recentTransactions.fold(0, (sum, element) {
      return sum + element.amount;
    });
  }

  List<Map<String, Object>> groupedTransactions() {
    return List.generate(7, (index) {
      var date = DateTime.now().subtract(Duration(days: index));
      double totalSum = 0;
      for (var tx in recentTransactions) {
        if (tx.date.day == date.day &&
            tx.date.month == date.month &&
            tx.date.year == date.year) {
          totalSum += tx.amount;
        }
      }
      print(totalPreviousWeek());
      print(totalSum / totalPreviousWeek());
      return {
        "day": DateFormat.E().format(date).toString().substring(0, 2),
        "amount": totalSum,
        "percentage": totalSum / totalPreviousWeek()
      };
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
        elevation: 5,
        margin: const EdgeInsets.all(10),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: groupedTransactions().map((tx) {
                return Flexible(fit: FlexFit.tight, child: ChartBar(tx));
              }).toList()),
        ));
  }
}
