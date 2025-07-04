import 'package:flutter/material.dart';

class ExpressionButtons extends StatefulWidget {
  final String item;
  final Color color;
  const ExpressionButtons({
    super.key, 
    required this.item, 
    required this.color});

  @override
  State<ExpressionButtons> createState() => _ExpressionButtonsState();
}

class _ExpressionButtonsState extends State<ExpressionButtons> {
  @override
  Widget build(BuildContext context) {
    return Card(
        elevation: 5,
        child: Container(
          width: 80,
          margin: EdgeInsets.all(4),
          padding: EdgeInsets.all(8.0),
          decoration: BoxDecoration(
            color: widget.color,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Center(
            child: Text(
              widget.item,
              style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
            ),
          ),
        ),
    );
  }
}
