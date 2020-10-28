import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import './widgets/add_transaction_card.dart';
import './widgets/transaction_list.dart';
import './models/transaction.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
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
          title: Text('Some_App'),
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
              Container(
                width: double.infinity,
                child: Card(
                  child: Text('Chart'),
                ),
              ),
              TransactionList(_userTransactionslist),
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
