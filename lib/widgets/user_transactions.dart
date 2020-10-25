import 'package:flutter/material.dart';

import './add_transaction_card.dart';
import './transaction_list.dart';
import '../models/transaction.dart';

class UserTransactions extends StatefulWidget {
  @override
  _UserTransactionsState createState() => _UserTransactionsState();
}

class _UserTransactionsState extends State<UserTransactions> {
  final _userTransactionslist = <Transaction>[
    Transaction(
        amount: 400.0,
        title: 'just some money i wasted',
        date: DateTime.now(),
        id: DateTime.now().toString()),
    Transaction(
        amount: 800.0,
        title: 'not much to say',
        date: DateTime.now(),
        id: DateTime.now().toString())
  ];

  void _addNewTransaction(double txAmount, String txTitle) {
    final newTx = Transaction(
        amount: txAmount,
        title: txTitle,
        date: DateTime.now(),
        id: DateTime.now().toString());
    setState(() {
      _userTransactionslist.add(newTx);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AddTransactionCard(
          // this widget consists of text fields and a button to add new transactions to the list
          _addNewTransaction,
        ),
        TransactionList(_userTransactionslist),
      ],
    );
  }
}
