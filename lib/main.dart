import 'dart:io';

import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

import './widgets/add_transaction_card.dart';
import './widgets/transaction_list.dart';
import './widgets/chart.dart';

import './models/transaction.dart';

void main() {
  // WidgetsFlutterBinding.ensureInitialized();
  // SystemChrome.setPreferredOrientations(
  //   [
  //     DeviceOrientation.portraitUp,
  //     DeviceOrientation.portraitDown,
  //   ],
  // );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
          primarySwatch: Colors.purple,
          accentColor: Colors.amberAccent,
          buttonColor: Colors.white,
          errorColor: Colors.red[600],
          textTheme:
              GoogleFonts.montserratTextTheme(Theme.of(context).textTheme),
        ),
        home: HomePage());
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Transaction> _userTransactionslist = [];
  bool _showChart = false;

  void _addNewTransaction(double txAmount, String txTitle, DateTime txDate) {
    final newTx = Transaction(
        amount: txAmount,
        title: txTitle,
        date: txDate,
        id: DateTime.now().toString());
    setState(() {
      _userTransactionslist.add(newTx);
    });
  }

  void _deleteTransaction(String id) {
    setState(
      () {
        _userTransactionslist.removeWhere((tx) => tx.id == id);
      },
    );
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
    final appbar = AppBar(
      title: Text('Expenses App'),
      actions: [
        Builder(
          builder: (context) => IconButton(
            icon: Icon(Icons.add),
            onPressed: () => showAddTransaction(context),
          ),
        )
      ], // title of the app.
    );
    final deviceHeight = (MediaQuery.of(context).size.height -
        appbar.preferredSize.height -
        MediaQuery.of(context).padding.top -
        MediaQuery.of(context).padding.bottom);

    final isLandscape =
        MediaQuery.of(context).orientation == Orientation.landscape;

    final txListWidget = Container(
      height: deviceHeight * 0.7,
      child: TransactionList(_userTransactionslist, _deleteTransaction),
    );

    return Scaffold(
      appBar: appbar,
      body: SingleChildScrollView(
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            if (isLandscape)
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Show Chart'),
                  Switch(
                    value: _showChart,
                    onChanged: (value) {
                      setState(() {
                        _showChart = value;
                      });
                    },
                  ),
                ],
              ),
            if (!isLandscape)
              Container(
                height: deviceHeight * 0.3,
                child: Chart(_recentTransactions),
              ),
            if (!isLandscape) txListWidget,
            if (isLandscape)
              _showChart
                  ? Container(
                      height: deviceHeight * 1,
                      child: Chart(_recentTransactions),
                    )
                  : txListWidget
          ],
        ),
      ),
      floatingActionButton: Builder(
        builder: (context) => FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () => showAddTransaction(context),
        ),
      ),
    );
  }
}
