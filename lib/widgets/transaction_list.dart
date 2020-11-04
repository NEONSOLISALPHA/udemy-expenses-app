import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:intl/intl.dart';
import '../models/transaction.dart';
import 'amount_box.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> userTransactionList;
  final Function deleteFunc;
  TransactionList(this.userTransactionList, this.deleteFunc);

  @override
  Widget build(BuildContext context) {
    return userTransactionList.isEmpty
        ? LayoutBuilder(
            builder: (ctx, constraints) {
              return Column(
                children: [
                  SizedBox(
                    height: 15,
                  ),
                  Text(
                    'No Transactions Added Yet!',
                    style: Theme.of(context).textTheme.headline6,
                  ),
                  SizedBox(
                    height: 40,
                    width: double.infinity,
                  ),
                  Container(
                    height: constraints.maxHeight * 0.6,
                    child: Image.asset(
                      'assets/images/waiting.png',
                      fit: BoxFit.cover,
                    ),
                  )
                ],
              );
            },
          )
        : ListView.builder(
            itemBuilder: (_, index) {
              // itembuilder automatically passes in context(here, '_') as an argument.
              return Card(
                  elevation: 5,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8)),
                  child: ListTile(
                    contentPadding: EdgeInsets.symmetric(vertical: 4),
                    leading: AmountBox(
                        '₹ ${userTransactionList[index].amount.toStringAsFixed(2)}'),
                    title: Text(
                      userTransactionList[index].title,
                      style: Theme.of(context).textTheme.headline6,
                    ),
                    subtitle: Text(
                      DateFormat('dd/MM/yyyy')
                          .format(userTransactionList[index].date)
                          .toString(),
                      style: Theme.of(context).textTheme.subtitle1,
                    ),
                    trailing: MediaQuery.of(context).size.width > 500
                        ? FlatButton.icon(
                            icon: Icon(Icons.delete),
                            onPressed: () =>
                                deleteFunc(userTransactionList[index].id),
                            label: Text(
                              'Delete',
                              style:
                                  Theme.of(context).textTheme.headline6.apply(
                                        color: Theme.of(context).errorColor,
                                      ),
                            ),
                            textColor: Theme.of(context).errorColor,
                          )
                        : IconButton(
                            iconSize: 30,
                            icon: Icon(Icons.delete),
                            color: Theme.of(context).errorColor,
                            onPressed: () =>
                                deleteFunc(userTransactionList[index].id),
                          ),
                  ));
            },
            itemCount: userTransactionList.length,
          );
  }
}
