import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

import './transaction.dart';
import './addTransactionCard.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MyAppState();
  }
}

class MyAppState extends State {
  final transactionList = <Transaction>[
    Transaction(
      amount: 400.0,
      description: 'Somthing',
      date: DateTime.now(),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Some_App'),
        ),
        body: Column(
          // mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              width: double.infinity,
              child: Card(
                child: Text('Chart'),
              ),
            ),
            AddTransactionCard(
              null,
              fieldTitle1: 'Title',
              fieldTitle2: 'Amount',
            ),
            Column(
              // mainAxisAlignment: MainAxisAlignment.start,
              children: transactionList.map(
                (tx) {
                  return Card(
                    child: Row(
                      children: [
                        Container(
                          margin: EdgeInsets.symmetric(
                              vertical: 10, horizontal: 15),
                          decoration: BoxDecoration(
                            border:
                                Border.all(color: Colors.purple[300], width: 2),
                          ),
                          padding:
                              EdgeInsets.symmetric(vertical: 3, horizontal: 4),
                          child: Text(
                            tx.amount.toString(),
                            style: GoogleFonts.montserrat(
                              textStyle: TextStyle(
                                  color: Colors.purple[300],
                                  fontWeight: FontWeight.w700,
                                  fontSize: 18),
                            ),
                          ),
                        ),
                        Column(
                          // crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              tx.description,
                              style: GoogleFonts.montserrat(
                                textStyle: TextStyle(
                                    fontWeight: FontWeight.w600, fontSize: 16),
                              ),
                            ),
                            Text(
                              DateFormat('dd/MM/yyyy')
                                  .format(tx.date)
                                  .toString(),
                              style: GoogleFonts.montserrat(
                                textStyle: TextStyle(
                                    fontWeight: FontWeight.w400, fontSize: 15),
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  );
                },
              ).toList(),
            ),
          ],
        ),
      ),
    );
  }
}
