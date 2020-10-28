import 'package:flutter/material.dart';
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
                    Container(
                      width: MediaQuery.of(context).size.width * 0.55,
                      child: Text(
                        userTransactionList[index].title,
                        style: Theme.of(context).textTheme.subtitle1,
                      ),
                    ),
                    Text(
                      DateFormat('dd/MM/yyyy')
                          .format(userTransactionList[index].date)
                          .toString(),
                      style: Theme.of(context).textTheme.bodyText2,
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
