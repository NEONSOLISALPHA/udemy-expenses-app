import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import './widgets/add_transaction_card.dart';
import './widgets/transaction_list.dart';
import './widgets/chart.dart';

import './models/transaction.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final List<Transaction> _userTransactionslist = [];

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

  List<Transaction> get _recentTransactions {
    return _userTransactionslist.where((tx) {
      return tx.date.isAfter(
        DateTime.now().subtract(
          Duration(
            days: 7,
          ),
        ),
      );
    }).toList();
  }

  void showAddTransaction(BuildContext ctx) {
    showModalBottomSheet(
        context: ctx,
        builder: (bCtx) {
          return GestureDetector(
            child: AddTransactionCard(_addNewTransaction),
            onTap: () {},
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.purple,
        accentColor: Colors.amberAccent,
        buttonColor: Colors.white,
        textTheme: GoogleFonts.montserratTextTheme(Theme.of(context).textTheme),
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Expenses App'),
          actions: [
            Builder(
              builder: (context) => IconButton(
                icon: Icon(Icons.add),
                onPressed: () => showAddTransaction(context),
              ),
            )
          ], // title of the app.
        ),
        body: SingleChildScrollView(
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Chart(_recentTransactions),
              Container(
                  child: _userTransactionslist.isEmpty
                      ? Column(
                          children: [
                            Text(
                              'No Transactions Added Yet!',
                              style: Theme.of(context).textTheme.headline6,
                            ),
                            SizedBox(
                              height: 40,
                              width: double.infinity,
                            ),
                            Container(
                              height: 500,
                              child: Image.asset(
                                'assets/images/waiting.png',
                                fit: BoxFit.cover,
                              ),
                            )
                          ],
                        )
                      : TransactionList(_userTransactionslist)),
            ],
          ),
        ),
        floatingActionButton: Builder(
          builder: (context) => FloatingActionButton(
            child: Icon(Icons.add),
            onPressed: () => showAddTransaction(context),
          ),
        ),
      ),
    );
  }
}
