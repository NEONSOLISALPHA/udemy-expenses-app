import 'package:flutter/foundation.dart';

class Transaction {
  final String description;
  final double amount;
  final DateTime date;

  Transaction(
      {@required this.amount, @required this.description, @required this.date});
}
