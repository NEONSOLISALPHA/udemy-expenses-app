import 'package:flutter/material.dart';

class AddTransactionCard extends StatelessWidget {
  final Function addTransactionButtonFunc;
  final String fieldTitle1;
  final String fieldTitle2;

  AddTransactionCard(this.addTransactionButtonFunc,
      {this.fieldTitle1, this.fieldTitle2});

  @override
  Widget build(BuildContext context) {
    String val1;
    String val2;

    return Card(
      elevation: 3,
      child: Container(
        margin: EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            TextField(
              decoration: InputDecoration(
                labelText: fieldTitle1,
                // contentPadding: EdgeInsets.all(5),
              ),
              onChanged: (value) => val1 = value,
            ),
            TextField(
              decoration: InputDecoration(
                labelText: fieldTitle2,
                // contentPadding: EdgeInsets.all(5),
              ),
              onChanged: (value) => val2 = value,
            ),
            RaisedButton(
              child: Text('Add Transaction'),
              onPressed: () => addTransactionButtonFunc(val1, val2),
            )
          ],
        ),
      ),
    );
  }
}
