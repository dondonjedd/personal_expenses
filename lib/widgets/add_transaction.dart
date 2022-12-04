import 'package:flutter/material.dart';

class addTransaction extends StatelessWidget {
  final titleController = TextEditingController();
  final amountController = TextEditingController();
  final Function addTransactionCallback;
  addTransaction(this.addTransactionCallback, {super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            TextField(
              decoration: const InputDecoration(labelText: "Title"),
              controller: titleController,
            ),
            TextField(
              decoration: const InputDecoration(labelText: "Amount"),
              controller: amountController,
              keyboardType: TextInputType.number,
            ),
            TextButton(
              onPressed: () => addTransactionCallback(
                  titleController.text, double.parse(amountController.text)),
              style: ElevatedButton.styleFrom(foregroundColor: Colors.purple),
              child: const Text("Add Transaction"),
            )
          ],
        ),
      ),
    );
  }
}
