import 'package:flutter/material.dart';

class AmountBox extends StatelessWidget {
  final String amount; // amount is a string with a currency symbol with it

  AmountBox(this.amount);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
      decoration: BoxDecoration(
        border: Border.all(color: Theme.of(context).primaryColor, width: 2),
      ),
      padding: EdgeInsets.symmetric(vertical: 3, horizontal: 4),
      child: Text(
        amount,
        style: Theme.of(context)
            .textTheme
            .headline6
            .apply(color: Theme.of(context).primaryColor),
      ),
    );
  }
}
