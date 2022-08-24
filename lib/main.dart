import 'package:calculator_task/constants/const_color.dart';
import 'package:calculator_task/widgets/keyBoard_buttons.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(Application());
}

class Application extends StatelessWidget {
  const Application({Key? key}) : super(key: key);

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
                child: Container(
                  color: backgroundGreyDark,
                ),
              ),
              Expanded(
                flex: 7,
                child: Container(
                  color: backgroundGrey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      KeyBoardButtons('ac','ce','%','/'),
                      KeyBoardButtons('7','8','9','*'),
                      KeyBoardButtons('4','5','6','-'),
                      KeyBoardButtons('1','2','3','+'),
                      KeyBoardButtons('00','0','.','='),
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
}
