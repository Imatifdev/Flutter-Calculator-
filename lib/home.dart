// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String equation = "0";
  String result = "0";
  String expression = "";
  Color yellow = Color(0xfff4b41A);

  Color orange = Color(0xfff49f1c);
  Color blue = Color(0xff143d59);
  myCal(String buttonText) {
    // contains all the arithmetic logics
    setState(() {
      if (buttonText == "C") {
        equation = "0";
        result = "0";
      } else if (buttonText == "Del") {
        equation = equation.substring(0, equation.length - 1);
        if (equation == "") {
          equation = "0";
        }
      } else if (buttonText == "=") {
        expression = equation;
        expression = expression.replaceAll('×', '*');
        expression = expression.replaceAll('÷', '/');

        try {
          Parser p = Parser();
          Expression exp = p.parse(expression);

          ContextModel cm = ContextModel();
          result = '${exp.evaluate(EvaluationType.REAL, cm)}';
        } catch (e) {
          result = "Error";
        }
      } else {
        if (equation == "0") {
          equation = buttonText;
        } else {
          equation = equation + buttonText;
        }
      }
    });
  }

  Widget myCustomButton(
      String buttonText, double buttonHeight, Color buttonColor) {
    return Card(
      elevation: 10,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
      child: Container(
        height: 90 * buttonHeight,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100), color: buttonColor),
        child: MaterialButton(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            onPressed: () => myCal(buttonText),
            child: Text(
              buttonText,
              style: TextStyle(
                  fontSize: 30.0,
                  fontWeight: FontWeight.normal,
                  color: Colors.white),
            )),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Muhammad Atif Pervaiz')),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              alignment: Alignment.centerRight,
              padding: EdgeInsets.fromLTRB(10, 20, 10, 0),
              child: Text(
                equation,
                style: TextStyle(fontSize: 35, color: Colors.black),
              ),
            ),
            Container(
              alignment: Alignment.centerRight,
              padding: EdgeInsets.fromLTRB(10, 30, 10, 0),
              child: Text(
                result,
                style: TextStyle(fontSize: 40, color: Colors.black),
              ),
            ),
            Expanded(
              child: Divider(
                thickness: 1,
                color: Colors.grey.shade400,
              ),
            ),
            Expanded(
              flex: 2,
              child: ListView(children: [
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  )),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        width: MediaQuery.of(context).size.width * .75,
                        child: Table(
                          children: [
                            TableRow(children: [
                              myCustomButton("C", 1, orange),
                              myCustomButton("Del", 1, yellow),
                              myCustomButton("÷", 1, yellow),
                            ]),
                            TableRow(children: [
                              myCustomButton("7", 1, blue),
                              myCustomButton("9", 1, blue),
                              myCustomButton("8", 1, blue),
                            ]),
                            TableRow(children: [
                              myCustomButton("4", 1, blue),
                              myCustomButton("5", 1, blue),
                              myCustomButton("6", 1, blue),
                            ]),
                            TableRow(children: [
                              myCustomButton("1", 1, blue),
                              myCustomButton("2", 1, blue),
                              myCustomButton("3", 1, blue),
                            ]),
                            TableRow(children: [
                              myCustomButton(".", 1, blue),
                              myCustomButton("0", 1, blue),
                              myCustomButton("00", 1, blue),
                            ]),
                          ],
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.25,
                        child: Table(
                          children: [
                            TableRow(children: [
                              myCustomButton("×", 1, yellow),
                            ]),
                            TableRow(children: [
                              myCustomButton("-", 1, yellow),
                            ]),
                            TableRow(children: [
                              myCustomButton("+", 1, yellow),
                            ]),
                            TableRow(children: [
                              myCustomButton("=", 2, orange),
                            ]),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ]),
            )
          ],
        ),
      ),
    );
  }
}
