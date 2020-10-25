import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import '../models/transaction.dart';
import 'amount_box.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> userTransactionList;

  TransactionList(this.userTransactionList);
  @override
  Widget build(BuildContext context) {
    return Column(
      // mainAxisAlignment: MainAxisAlignment.start,
      children: userTransactionList.map(
        (tx) {
          return Card(
            child: Row(
              children: [
                AmountBox(tx.amount),
                Column(
                  // crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      tx.title,
                      style: GoogleFonts.montserrat(
                        textStyle: TextStyle(
                            fontWeight: FontWeight.w600, fontSize: 16),
                      ),
                    ),
                    Text(
                      DateFormat('dd/MM/yyyy').format(tx.date).toString(),
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
    );
  }
}
