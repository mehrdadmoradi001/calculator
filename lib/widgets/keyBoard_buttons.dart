import 'package:calculator_task/constants/const_color.dart';
import 'package:flutter/material.dart';

Widget KeyBoardButtons(String text1, String text2, String text3, String text4) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceAround,
    children: [
      _getPadding(text1),
      _getPadding(text2),
      _getPadding(text3),
      _getPadding(text4),
    ],
  );
}

bool isOperator(String text) {
  var list = ['ac', 'ce', '%', '/', '*', '-', '+', '=']; //
  for (var item in list) {
    if (text == item) {
      return true;
    }
  }
  return false;
}

Color getBackgroundColor(String text) {
  if (isOperator(text)) {
    return backgroundGreyDark;
  } else {
    return backgroundGrey;
  }
}

Color getColorText(String text) {
  //
  if (isOperator(text)) {
    return textGreen;
  } else {
    return textGrey;
  }
}

Widget _getPadding(String text) {
  return TextButton(
    style: TextButton.styleFrom(
      shape: CircleBorder(
        side: BorderSide(width: 0, color: Colors.transparent),
      ),
      backgroundColor: getBackgroundColor(text),
    ),
    onPressed: () {},
    child: Padding(
      padding: EdgeInsets.all(3),
      child: Text(
        text,
        style: TextStyle(color: getColorText(text), fontSize: 26),
      ),
    ),
  );
}
