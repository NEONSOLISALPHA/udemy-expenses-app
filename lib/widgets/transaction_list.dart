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
    return Container(
      height: 500,
      child: ListView.builder(
        itemBuilder: (ctx, index) {
          return Card(
            elevation: 5,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            child: Row(
              children: [
                AmountBox(
                    '₹ ${userTransactionList[index].amount.toStringAsFixed(2)}'),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      userTransactionList[index].title,
                      style: GoogleFonts.montserrat(
                        textStyle: TextStyle(
                            fontWeight: FontWeight.w600, fontSize: 16),
                      ),
                    ),
                    Text(
                      DateFormat('dd/MM/yyyy')
                          .format(userTransactionList[index].date)
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
        itemCount: userTransactionList.length,
      ),
    );
  }
}
