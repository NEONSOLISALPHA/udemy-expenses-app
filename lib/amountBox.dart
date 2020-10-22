import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AmountBox extends StatelessWidget {
  final double amount;

  AmountBox(this.amount);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.purple[300], width: 2),
      ),
      padding: EdgeInsets.symmetric(vertical: 3, horizontal: 4),
      child: Text(
        amount.toString(),
        style: GoogleFonts.montserrat(
          textStyle: TextStyle(
              color: Colors.purple[300],
              fontWeight: FontWeight.w700,
              fontSize: 18),
        ),
      ),
    );
  }
}
