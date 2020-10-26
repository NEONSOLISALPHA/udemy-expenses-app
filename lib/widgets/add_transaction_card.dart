import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AddTransactionCard extends StatelessWidget {
  final Function addTransactionButtonFunc;

  AddTransactionCard(this.addTransactionButtonFunc);

  @override
  Widget build(BuildContext context) {
    final titleController = TextEditingController();
    final amountController = TextEditingController();

    void submitData() {
      final enteredTitle = titleController.text;
      final enteredAmount = double.parse(amountController.text);

      if (enteredTitle.isEmpty || enteredAmount <= 0) {
        return;
      }
      addTransactionButtonFunc(
        enteredAmount,
        enteredTitle,
      );
    }

    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      elevation: 3,
      child: Container(
        padding: EdgeInsets.all(5),
        margin: EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
              margin: EdgeInsets.fromLTRB(0, 20, 6, 10),
              child: RaisedButton(
                padding: EdgeInsets.symmetric(vertical: 9, horizontal: 13),
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  side: BorderSide(
                      color: Color.fromRGBO(36, 36, 36, 100), width: 3),
                ),
                child: Text(
                  'Add Transaction',
                  style: GoogleFonts.montserrat(
                    textStyle: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 17,
                        color: Colors.black87),
                  ),
                ),
                onPressed: () => submitData(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
