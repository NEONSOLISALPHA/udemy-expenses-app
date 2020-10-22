import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'transaction.dart';
import 'amountBox.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactionList;

  TransactionList(this.transactionList);

  @override
  Widget build(BuildContext context) {
    return Column(
      // mainAxisAlignment: MainAxisAlignment.start,
      children: transactionList.map(
        (tx) {
          return Card(
            child: Row(
              children: [
                AmountBox(tx.amount),
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
