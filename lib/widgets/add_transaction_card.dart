import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AddTransactionCard extends StatefulWidget {
  final Function addTransactionButtonFunc;

  AddTransactionCard(this.addTransactionButtonFunc);

  @override
  _AddTransactionCardState createState() => _AddTransactionCardState();
}

class _AddTransactionCardState extends State<AddTransactionCard> {
  final titleController = TextEditingController();
  final amountController = TextEditingController();
  DateTime _enteredDate;

  @override
  Widget build(BuildContext context) {
    void _submitData() {
      final _enteredTitle = titleController.text;
      final _enteredAmount = double.parse(amountController.text);

      if (_enteredTitle.isEmpty ||
          _enteredAmount <= 0 ||
          _enteredDate == null) {
        return;
      }
      widget.addTransactionButtonFunc(
        _enteredAmount,
        _enteredTitle,
        _enteredDate,
      );
      Navigator.of(context).pop();
    }

    void presentDatePicker() {
      showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2020),
        lastDate: DateTime.now(),
      ).then((pickedDate) {
        if (pickedDate == null) {
          return;
        } else {
          _enteredDate = pickedDate;
        }
      });
    }

    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.fromLTRB(
            5, 5, 5, MediaQuery.of(context).viewInsets.bottom + 5),
        margin: EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            TextField(
              // Title Field
              onSubmitted: (_) =>
                  _submitData, // accepts the String value(_) that flutter passes by defaul, to not throw errors
              decoration: InputDecoration(
                labelText: 'Title',
                // contentPadding: EdgeInsets.all(5),
              ),
              controller: titleController,
            ),
            TextField(
              //Amount Field
              onSubmitted: (_) =>
                  _submitData(), // accepts the String value(_) that flutter passes by defaul, to not throw errors
              keyboardType: TextInputType.numberWithOptions(decimal: true),
              decoration: InputDecoration(
                labelText: 'Amount',
                // contentPadding: EdgeInsets.all(5),
              ),
              controller: amountController,
            ),
            Container(
              child: Row(
                children: [
                  Text(
                      _enteredDate == null
                          ? 'No Date Chosen'
                          : 'Picked Date: ${DateFormat('dd/MM/yyyy').format(_enteredDate)}',
                      style: Theme.of(context).textTheme.subtitle1),
                  Expanded(
                    child: Container(
                      child: FlatButton(
                          textColor: Theme.of(context).primaryColor,
                          child: Text(
                            'Choose Date',
                            style: Theme.of(context)
                                .textTheme
                                .subtitle1
                                .apply(color: Theme.of(context).primaryColor),
                          ),
                          onPressed: presentDatePicker),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.all(15),
              child: RaisedButton(
                padding: EdgeInsets.symmetric(vertical: 9, horizontal: 13),
                shape: RoundedRectangleBorder(
                  side: BorderSide(
                      color: Theme.of(context).primaryColor, width: 3),
                ),
                child: Text(
                  'Add Transaction',
                  style: Theme.of(context)
                      .textTheme
                      .headline6
                      .apply(color: Theme.of(context).primaryColor),
                ),
                onPressed: () => _submitData(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
