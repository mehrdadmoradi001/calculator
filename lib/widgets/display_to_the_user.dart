import 'package:calculator_task/constants/const_color.dart';
import 'package:flutter/material.dart';

Widget getDisplayToTheUser(String text, String txt_result) {
  return Container(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Padding(
          padding: EdgeInsets.all(8),
          child: Text(
            text,
            textAlign: TextAlign.end,
            style: TextStyle(
                color: textGreen, fontSize: 28, fontWeight: FontWeight.bold),
          ),
        ),
        Padding(
          padding: EdgeInsets.all(8),
          child: Text(
            txt_result,
            textAlign: TextAlign.end,
            style: TextStyle(fontSize: 62, color: textGrey),
          ),
        ),
      ],
    ),
    color: backgroundGreyDark,
  );
}
