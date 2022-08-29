import 'package:calculator_task/constants/const_color.dart';
import 'package:calculator_task/widgets/display_to_the_user.dart';
import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

void main() {
  runApp(CalculatorApplication());
}

class CalculatorApplication extends StatefulWidget {
  const CalculatorApplication({Key? key}) : super(key: key);

  @override
  State<CalculatorApplication> createState() => _CalculatorApplicationState();
}

class _CalculatorApplicationState extends State<CalculatorApplication> {
  var inputUser = '';
  var result = '';
  var list = ['ac', 'ce', '%', '/', '*', '-', '+', '='];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              Expanded(
                flex: 3,
                child: getDisplayToTheUser(inputUser, result),
              ),
              Expanded(
                flex: 7,
                child: Container(
                  color: backgroundGrey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      KeyBoardButtons('ac', 'ce', '%', '/'),
                      KeyBoardButtons('7', '8', '9', '*'),
                      KeyBoardButtons('4', '5', '6', '-'),
                      KeyBoardButtons('1', '2', '3', '+'),
                      KeyBoardButtons('00', '0', '.', '='),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget KeyBoardButtons(
      String text1, String text2, String text3, String text4) {
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
    //
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
      onPressed: () {
        if (text == 'ce' && inputUser.length > 0) {
          setState(() {
            inputUser = inputUser.substring(0, inputUser.length - 1); //
            result = '';
          });
        } else if (text == 'ce') {
          setState(() {
            inputUser = '';
          });
        } else if (text == '=') {
          Parser parser = Parser();
          Expression expression = parser.parse(inputUser);
          ContextModel contextModel = ContextModel();
          double eval =
              expression.evaluate(EvaluationType.REAL, contextModel); //
          setState(() {
            result = eval.toString();
          });
        } else if (text == 'ac') {
          setState(() {
            inputUser = '';
            result = '';
          });
        } else {
          setState(() {
            inputUser = inputUser + text;
          });
        }
      },
      child: Padding(
        padding: EdgeInsets.all(3),
        child: Text(
          text,
          style: TextStyle(color: getColorText(text), fontSize: 26),
        ),
      ),
    );
  }
}
