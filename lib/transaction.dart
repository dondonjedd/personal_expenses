import 'package:flutter/material.dart';

class transaction {
  @required
  final int id;
  @required
  final String title;
  @required
  final double amount;
  @required
  final DateTime date;

  transaction(
      {required this.id,
      required this.title,
      required this.amount,
      required this.date});
}
