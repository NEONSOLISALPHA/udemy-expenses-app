import 'package:flutter/material.dart';

class AddTransactionCard extends StatelessWidget {
  final Function addTransactionButtonFunc;

  AddTransactionCard(this.addTransactionButtonFunc);

  @override
  Widget build(BuildContext context) {
    final titleController = TextEditingController();
    final amountController = TextEditingController();

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
                labelText: 'Title',
                // contentPadding: EdgeInsets.all(5),
              ),
              controller: titleController,
            ),
            TextField(
              decoration: InputDecoration(
                labelText: 'Amount',
                // contentPadding: EdgeInsets.all(5),
              ),
              controller: amountController,
            ),
            RaisedButton(
              child: Text('Add Transaction'),
              onPressed: () => addTransactionButtonFunc(
                  double.parse(amountController.text), titleController.text),
            )
          ],
        ),
      ),
    );
  }
}
