import 'package:calculator_app/expression_buttons.dart';
import 'package:flutter/material.dart';
import "package:calculator_app/solve_stack.dart";

class Calculator extends StatefulWidget {
  const Calculator({super.key});

  @override
  State<Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  final numColor = Color.fromRGBO(125, 130, 134, 1);
  final sideColor = Color.fromRGBO(236, 109, 51, 1);
  final topColor = Color.fromRGBO(67, 74, 73, 1);
  final tappedNumColor = Color.fromRGBO(163, 169, 175, 1);
  final tappedSideColor = Color.fromRGBO(237, 136, 89, 1);
  final tappedTopColor = Color.fromRGBO(119, 129, 127, 1);
  bool tapped = false;

  String displayResult = "0";
  bool isOperatorOff = true;
  bool isNegative = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            "Calculator",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
      ),
      body: Column(
        children: [
          SizedBox(height: 10),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            height: 200,
            width: 500,
            decoration: BoxDecoration(
              color: numColor,
              borderRadius: BorderRadius.circular(40),
            ),
            child: Align(
              alignment: Alignment.bottomRight,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      displayResult,
                      maxLines: 1,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 40,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(height: 10),
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () {
                      setState(() {
                        tapped = true;
                        displayResult = "0";
                        isOperatorOff = true;
                      });
                    },
                    child: ExpressionButtons(item: "AC", color: topColor),
                  ),
                  InkWell(
                    onTap: () {
                      setState(() {
                        if (displayResult != "ERROR") {
                          if (displayResult.length > 1 &&
                              displayResult.substring(0) != "0") {
                            displayResult = displayResult.substring(
                              0,
                              displayResult.length - 1,
                            );
                          } else if (SolveStack().isOperator(
                            displayResult.substring(
                              0,
                              displayResult.length - 1,
                            ),
                          )) {
                            isOperatorOff = true;
                          } else {
                            displayResult = "0";
                          }
                        }
                      });
                    },
                    child: ExpressionButtons(item: "DEL", color: topColor),
                  ),
                  InkWell(
                    onTap: () => setState(() {
                      if (displayResult != "ERROR") {
                        if (isOperatorOff) {
                          displayResult = "$displayResult%";
                          isOperatorOff = false;
                        } else {
                          displayResult = SolveStack().solveEquation(
                            displayResult,
                          );
                          isOperatorOff = true;
                        }
                      }
                    }),
                    child: ExpressionButtons(item: "%", color: topColor),
                  ),
                  InkWell(
                    onTap: () => setState(() {
                      if (displayResult != "ERROR") {
                        if (isOperatorOff) {
                          displayResult = "$displayResult÷";
                          isOperatorOff = false;
                        } else {
                          displayResult = SolveStack().solveEquation(
                            displayResult,
                          );
                          isOperatorOff = true;
                        }
                      }
                    }),
                    child: ExpressionButtons(item: "÷", color: sideColor),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () => setState(() {
                      if (displayResult != "ERROR") {
                        displayResult.substring(0).hashCode == "0".hashCode
                            ? displayResult = "7"
                            : displayResult = "${displayResult}7";
                      }
                    }),
                    child: ExpressionButtons(item: "7", color: numColor),
                  ),
                  InkWell(
                    onTap: () => setState(() {
                      if (displayResult != "ERROR") {
                        displayResult.substring(0).hashCode == "0".hashCode
                            ? displayResult = "8"
                            : displayResult = "${displayResult}8";
                      }
                    }),
                    child: ExpressionButtons(item: "8", color: numColor),
                  ),
                  InkWell(
                    onTap: () => setState(() {
                      if (displayResult != "ERROR") {
                        displayResult.substring(0).hashCode == "0".hashCode
                            ? displayResult = "9"
                            : displayResult = "${displayResult}9";
                      }
                    }),
                    child: ExpressionButtons(item: "9", color: numColor),
                  ),
                  InkWell(
                    onTap: () => setState(() {
                      if (displayResult != "ERROR") {
                        if (isOperatorOff) {
                          displayResult = "$displayResult×";
                          isOperatorOff = false;
                        } else {
                          displayResult = SolveStack().solveEquation(
                            displayResult,
                          );
                          isOperatorOff = true;
                        }
                      }
                    }),
                    child: ExpressionButtons(item: "×", color: sideColor),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () => setState(() {
                      if (displayResult != "ERROR") {
                        displayResult.substring(0).hashCode == "0".hashCode
                            ? displayResult = "4"
                            : displayResult = "${displayResult}4";
                      }
                    }),
                    child: ExpressionButtons(item: "4", color: numColor),
                  ),
                  InkWell(
                    onTap: () => setState(() {
                      if (displayResult != "ERROR") {
                        displayResult.substring(0).hashCode == "0".hashCode
                            ? displayResult = "5"
                            : displayResult = "${displayResult}5";
                      }
                    }),
                    child: ExpressionButtons(item: "5", color: numColor),
                  ),
                  InkWell(
                    onTap: () => setState(() {
                      if (displayResult != "ERROR") {
                        displayResult.substring(0).hashCode == "0".hashCode
                            ? displayResult = "6"
                            : displayResult = "${displayResult}6";
                      }
                    }),
                    child: ExpressionButtons(item: "6", color: numColor),
                  ),
                  InkWell(
                    onTap: () => setState(() {
                      if (displayResult != "ERROR") {
                        if (isOperatorOff) {
                          displayResult = "$displayResult−";
                          isOperatorOff = false;
                        } else {
                          displayResult = SolveStack().solveEquation(
                            displayResult,
                          );
                          isOperatorOff = true;
                        }
                      }
                    }),
                    child: ExpressionButtons(item: "−", color: sideColor),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () => setState(() {
                      if (displayResult != "ERROR") {
                        displayResult.substring(0).hashCode == "0".hashCode
                            ? displayResult = "1"
                            : displayResult = "${displayResult}1";
                      }
                    }),
                    child: ExpressionButtons(item: "1", color: numColor),
                  ),
                  InkWell(
                    onTap: () => setState(() {
                      if (displayResult != "ERROR") {
                        displayResult.substring(0).hashCode == "0".hashCode
                            ? displayResult = "2"
                            : displayResult = "${displayResult}2";
                      }
                    }),
                    child: ExpressionButtons(item: "2", color: numColor),
                  ),
                  InkWell(
                    onTap: () => setState(() {
                      if (displayResult != "ERROR") {
                        displayResult.substring(0).hashCode == "0".hashCode
                            ? displayResult = "3"
                            : displayResult = "${displayResult}3";
                      }
                    }),
                    child: ExpressionButtons(item: "3", color: numColor),
                  ),
                  InkWell(
                    onTap: () => setState(() {
                      if (displayResult != "ERROR") {
                        if (isOperatorOff) {
                          displayResult = "$displayResult+";
                          isOperatorOff = false;
                        } else {
                          displayResult = SolveStack().solveEquation(
                            displayResult,
                          );
                          isOperatorOff = true;
                        }
                      }
                    }),
                    child: ExpressionButtons(item: "+", color: sideColor),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () => setState(() {
                      if (displayResult != "ERROR") {
                        if (displayResult.hashCode != "0".hashCode) {
                          displayResult = SolveStack().negate(displayResult);
                        } else {
                          displayResult = displayResult;
                        }
                      }
                    }),
                    child: ExpressionButtons(item: "+/-", color: numColor),
                  ),
                  InkWell(
                    onTap: () => setState(() {
                      if (displayResult != "ERROR") {
                        displayResult.hashCode != "0".hashCode
                            ? displayResult = "${displayResult}0"
                            : displayResult = displayResult;
                      }
                    }),
                    child: ExpressionButtons(item: "0", color: numColor),
                  ),
                  InkWell(
                    onTap: () => setState(() {
                      if (displayResult != "ERROR") {
                        if (displayResult.length > 1) {
                          if (displayResult.contains("+") ||
                              displayResult.contains("−") ||
                              displayResult.contains("×") ||
                              displayResult.contains("÷") ||
                              displayResult.contains("%")) {
                            if (displayResult.substring(
                                  displayResult.length - 1,
                                  displayResult.length,
                                ) !=
                                ".") {
                              displayResult = "$displayResult.";
                            }
                          } else {
                            return;
                          }
                        } else {
                          displayResult = "$displayResult.";
                        }
                      }
                    }),
                    child: ExpressionButtons(item: ".", color: numColor),
                  ),
                  InkWell(
                    onTap: () => setState(() {
                      if (!(displayResult.contains("+") ||
                          displayResult.contains("−") ||
                          displayResult.contains("×") ||
                          displayResult.contains("÷") ||
                          displayResult.contains("%"))) {
                        displayResult = displayResult;
                      } else {
                        displayResult = SolveStack().solveEquation(
                          displayResult,
                        );
                      }
                      isOperatorOff = true;
                    }),

                    child: ExpressionButtons(item: "=", color: sideColor),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
