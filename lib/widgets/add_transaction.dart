import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AddTransaction extends StatefulWidget {
  final Function addTransactionCallback;
  const AddTransaction(this.addTransactionCallback, {super.key});

  @override
  State<AddTransaction> createState() => _AddTransactionState();
}

class _AddTransactionState extends State<AddTransaction> {
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
  DateTime? _chosenDate;

  submitData() {
    if (_titleController.text.isEmpty ||
        double.parse(_amountController.text) <= 0 ||
        _chosenDate == null) {
      return;
    }

    final enteredTitle = _titleController.text;
    final enteredAmount = double.parse(_amountController.text);

    widget.addTransactionCallback(enteredTitle, enteredAmount, _chosenDate);

    Navigator.of(context).pop();
  }

  _presentDatePicker() {
    showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(DateTime.now().year),
            lastDate: DateTime.now())
        .then((value) {
      if (value == null) {
        return;
      }
      setState(() {
        _chosenDate = value;
      });
    });
  }

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
              controller: _titleController,
              onSubmitted: (_) => submitData(),
            ),
            TextField(
              decoration: const InputDecoration(labelText: "Amount"),
              controller: _amountController,
              keyboardType: TextInputType.number,
              onSubmitted: (_) => submitData(),
            ),
            Row(
              children: [
                _chosenDate == null
                    ? const Text("No date chosen")
                    : Text(DateFormat.yMd().format(_chosenDate!)),
                TextButton(
                    onPressed: _presentDatePicker,
                    child: Text(
                      "Choose a date",
                      style: TextStyle(
                          color: Theme.of(context).colorScheme.primary),
                    )),
              ],
            ),
            ElevatedButton(
              onPressed: submitData,
              child: const Text("Add Transaction"),
            ),
          ],
        ),
      ),
    );
  }
}
