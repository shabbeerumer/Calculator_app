import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';
import 'buttons.dart';

class Screen1 extends StatefulWidget {
  const Screen1({Key? key}) : super(key: key);

  @override
  State<Screen1> createState() => _Screen1State();
}

class _Screen1State extends State<Screen1> {
  var userInput = '';
  var answer = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.purple,
        title: Text('Calculatar App'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Align(
                    child: Text(
                      userInput.toString(),
                      style: TextStyle(
                        fontSize: 30,
                        color: Colors.white,
                      ),
                    ),
                    alignment: Alignment.bottomRight,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    answer.toString(),
                    style: TextStyle(fontSize: 30, color: Colors.white),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    MyButtons(
                        title: 'AC',
                        onpress: () {
                          userInput = '';
                          answer = '';
                          setState(() {});
                        }),
                    MyButtons(
                        title: '+/-',
                        onpress: () {
                          userInput += '+/-';
                          setState(() {});
                        }),
                    MyButtons(
                        title: '%',
                        onpress: () {
                          userInput += '%';
                          setState(() {});
                        }),
                    MyButtons(
                        title: '/',
                        color: Color(0Xffffa00a),
                        onpress: () {
                          userInput += '/';
                          setState(() {});
                        }),
                  ],
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    MyButtons(
                        title: '7',
                        onpress: () {
                          userInput += '7';
                          setState(() {});
                        }),
                    MyButtons(
                        title: '8',
                        onpress: () {
                          userInput += '8';
                          setState(() {});
                        }),
                    MyButtons(
                        title: '0',
                        onpress: () {
                          userInput += '0';
                          setState(() {});
                        }),
                    MyButtons(
                        title: 'x',
                        color: Color(0xffffa00a),
                        onpress: () {
                          userInput += 'x';
                          setState(() {});
                        }),
                  ],
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    MyButtons(
                        title: '4',
                        onpress: () {
                          userInput += '4';
                          setState(() {});
                        }),
                    MyButtons(
                        title: '5',
                        onpress: () {
                          userInput += '5';
                          setState(() {});
                        }),
                    MyButtons(
                        title: '6',
                        onpress: () {
                          userInput += '6';
                          setState(() {});
                        }),
                    MyButtons(
                        title: '-',
                        color: Color(0Xffffa00a),
                        onpress: () {
                          userInput += '-';
                          setState(() {});
                        }),
                  ],
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    MyButtons(
                        title: '1',
                        onpress: () {
                          userInput += '1';
                          setState(() {});
                        }),
                    MyButtons(
                        title: '2',
                        onpress: () {
                          userInput += '2';
                          setState(() {});
                        }),
                    MyButtons(
                        title: '3',
                        onpress: () {
                          userInput += '3';
                          setState(() {});
                        }),
                    MyButtons(
                        title: '+',
                        color: Color(0Xffffa00a),
                        onpress: () {
                          userInput += '+';
                          setState(() {});
                        }),
                  ],
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    MyButtons(
                        title: '0',
                        onpress: () {
                          userInput += '0';
                          setState(() {});
                        }),
                    MyButtons(
                        title: '.',
                        onpress: () {
                          userInput += '.';
                          setState(() {});
                        }),
                    MyButtons(
                        title: 'DEL',
                        onpress: () {
                          userInput =
                              userInput.substring(0, userInput.length - 1);
                          setState(() {});
                        }),
                    MyButtons(
                        title: '=',
                        color: Color(0Xffffa00a),
                        onpress: () {
                          equallpress();
                          setState(() {});
                        }),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void equallpress() {
    String finalUserInput = userInput;
    finalUserInput = userInput.replaceAll('x', '*');
    Parser p = Parser();
    Expression expression = p.parse(finalUserInput);
    ContextModel contextModel = ContextModel();
    double eval = expression.evaluate(EvaluationType.REAL, contextModel);
    answer = eval.toString();
  }
}
