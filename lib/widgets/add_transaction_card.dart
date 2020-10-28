import 'package:flutter/material.dart';

class AddTransactionCard extends StatefulWidget {
  final Function addTransactionButtonFunc;

  AddTransactionCard(this.addTransactionButtonFunc);

  @override
  _AddTransactionCardState createState() => _AddTransactionCardState();
}

class _AddTransactionCardState extends State<AddTransactionCard> {
  final titleController = TextEditingController();
  final amountController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    void submitData() {
      final enteredTitle = titleController.text;
      final enteredAmount = double.parse(amountController.text);

      if (enteredTitle.isEmpty || enteredAmount <= 0) {
        return;
      }
      widget.addTransactionButtonFunc(
        enteredAmount,
        enteredTitle,
      );
      Navigator.of(context).pop();
    }

    return Container(
      padding: EdgeInsets.all(5),
      margin: EdgeInsets.all(10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          TextField(
            // Title Field
            onSubmitted: (_) =>
                submitData, // accepts the String value(_) that flutter passes by defaul, to not throw errors
            decoration: InputDecoration(
              labelText: 'Title',
              // contentPadding: EdgeInsets.all(5),
            ),
            controller: titleController,
          ),
          TextField(
            //Amount Field
            onSubmitted: (_) =>
                submitData(), // accepts the String value(_) that flutter passes by defaul, to not throw errors
            keyboardType: TextInputType.numberWithOptions(decimal: true),
            decoration: InputDecoration(
              labelText: 'Amount',
              // contentPadding: EdgeInsets.all(5),
            ),
            controller: amountController,
          ),
          Container(
            margin: EdgeInsets.all(15),
            child: RaisedButton(
              padding: EdgeInsets.symmetric(vertical: 9, horizontal: 13),
              shape: RoundedRectangleBorder(
                side:
                    BorderSide(color: Theme.of(context).primaryColor, width: 3),
              ),
              child: Text(
                'Add Transaction',
                style: Theme.of(context)
                    .textTheme
                    .headline6
                    .apply(color: Theme.of(context).primaryColor),
              ),
              onPressed: () => submitData(),
            ),
          ),
        ],
      ),
    );
  }
}
