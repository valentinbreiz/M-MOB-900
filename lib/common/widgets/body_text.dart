import 'package:flutter/material.dart';

class BodyText extends StatelessWidget {
  BodyText({required this.text, this.color = Colors.black, super.key});

  final String text;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(fontSize: 16, color: color),
    );
  }
}
