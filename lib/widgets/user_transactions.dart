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
      description: 'just some money i wasted',
      date: DateTime.now(),
    ),
    Transaction(
      amount: 800.0,
      description: 'not much to say',
      date: DateTime.now(),
    )
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AddTransactionCard(
          // this widget consists of text fields and a button to add new transactions to the list.
          (field1, field2) {
            print(field1);
            print(field2);
          },
          fieldTitle1: 'Title',
          fieldTitle2: 'Amount',
        ),
        TransactionList(_userTransactionslist),
      ],
    );
  }
}
