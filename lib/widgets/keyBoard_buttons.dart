import 'package:calculator_task/constants/const_color.dart';
import 'package:flutter/material.dart';



Widget KeyBoardButtons(String text1 , String text2, String text3, String text4) {
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


Widget _getPadding(String text){
  return TextButton(
    onPressed: () {},
    child: Padding(
      padding: EdgeInsets.all(3),
      child: Text(
        text,
        style: TextStyle(color: textGrey, fontSize: 26),
      ),
    ),
  );
}