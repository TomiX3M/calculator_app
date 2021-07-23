import 'package:calculator/widgets/calculatorButton.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => runApp(CalculatorApp());

class CalculatorApp extends StatefulWidget {
  @override
  CalculatorApp_State createState() => CalculatorApp_State();
}

// ignore: camel_case_types
class CalculatorApp_State extends State<CalculatorApp> {
  late int firstNumber;
  late int secondNumber;
  late String history = '';
  late String operation;
  late String res;
  late String textToDisplay = '';

  void btnPress(String btn) {
    if (btn == 'C') {
      firstNumber = 0;
      secondNumber = 0;
      res = '';
    } else if (btn == 'AC') {
      firstNumber = 0;
      secondNumber = 0;
      res = '';
      history = '';
    } else if (btn == '+/-') {
      if (textToDisplay[0] != '-') {
        res = '-' + textToDisplay;
      } else {
        res = textToDisplay.substring(1);
      }
    } else if (btn == '<') {
      res = textToDisplay.substring(0, textToDisplay.length - 1);
    } else if (btn == '+' || btn == '-' || btn == 'X' || btn == '/') {
      firstNumber = int.parse(textToDisplay);
      res = '';
      operation = btn;
    } else if (btn == '=') {
      secondNumber = int.parse(textToDisplay);
      if (operation == '+') {
        res = (firstNumber + secondNumber).toString();
        history =
            (firstNumber).toString() + operation + secondNumber.toString();
      }
      if (operation == '-') {
        res = (firstNumber - secondNumber).toString();
        history =
            (firstNumber).toString() + operation + secondNumber.toString();
      }
      if (operation == 'X') {
        res = (firstNumber * secondNumber).toString();
        history =
            (firstNumber).toString() + operation + secondNumber.toString();
      }
      if (operation == '/') {
        res = (firstNumber / secondNumber).toString();
        history =
            (firstNumber).toString() + operation + secondNumber.toString();
      }
      if (operation == '+') {
        res = (firstNumber + secondNumber).toString();
        history = (firstNumber).toString() + operation + secondNumber.toString();
      }
    } else {
      res = int.parse(textToDisplay + btn).toString();
    }
    setState(() {
      textToDisplay = res;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
          primarySwatch: Colors.blueGrey,
        ),
        home: Scaffold(
          backgroundColor: Color(0xFF28527a),
          appBar: AppBar(
            title: Center(child: Text('Flutter Calculator')),
          ),
          body: SafeArea(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Container(
                padding: EdgeInsets.only(right: 12),
                child: Text(history,
                    style: TextStyle(
                      color: Color(0x66FFFFFF),
                      fontSize: 14,
                    )),
                alignment: Alignment(1, 1),
              ),
              Container(
                padding: EdgeInsets.all(10),
                child: Text(
                  textToDisplay,
                  style: TextStyle(color: Colors.white, fontSize: 46),
                ),
                alignment: Alignment(1.0, 1.0),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  CalculatorButton(
                      text: 'AC', color: Color(0xFF8ac4d0), callback: btnPress),
                  CalculatorButton(
                      text: 'C', color: Color(0xFF8ac4d0), callback: btnPress),
                  CalculatorButton(
                      text: '<',
                      color: Colors.yellow.shade800,
                      callback: btnPress),
                  CalculatorButton(
                      text: '/',
                      color: Colors.yellow.shade800,
                      callback: btnPress),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  CalculatorButton(
                      text: '9', color: Color(0xFF8ac4d0), callback: btnPress),
                  CalculatorButton(
                      text: '8', color: Color(0xFF8ac4d0), callback: btnPress),
                  CalculatorButton(
                      text: '7', color: Color(0xFF8ac4d0), callback: btnPress),
                  CalculatorButton(
                      text: 'X',
                      color: Colors.yellow.shade800,
                      callback: btnPress),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  CalculatorButton(
                      text: '6', color: Color(0xFF8ac4d0), callback: btnPress),
                  CalculatorButton(
                      text: '6', color: Color(0xFF8ac4d0), callback: btnPress),
                  CalculatorButton(
                      text: '4', color: Color(0xFF8ac4d0), callback: btnPress),
                  CalculatorButton(
                      text: '-',
                      color: Colors.yellow.shade800,
                      callback: btnPress),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  CalculatorButton(
                      text: '3', color: Color(0xFF8ac4d0), callback: btnPress),
                  CalculatorButton(
                      text: '2', color: Color(0xFF8ac4d0), callback: btnPress),
                  CalculatorButton(
                      text: '1', color: Color(0xFF8ac4d0), callback: btnPress),
                  CalculatorButton(
                      text: '+',
                      color: Colors.yellow.shade800,
                      callback: btnPress),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  CalculatorButton(
                      text: '+/-',
                      color: Color(0xFF8ac4d0),
                      callback: btnPress),
                  CalculatorButton(
                      text: '0', color: Color(0xFF8ac4d0), callback: btnPress),
                  CalculatorButton(
                      text: '00', color: Color(0xFF8ac4d0), callback: btnPress),
                  CalculatorButton(
                      text: '=',
                      color: Colors.yellow.shade800,
                      callback: btnPress),
                ],
              ),
            ],
          )),
        ));
  }
}
