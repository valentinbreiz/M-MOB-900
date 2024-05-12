import 'package:flutter/material.dart';

class HeaderText extends StatelessWidget {
  HeaderText({required this.text, this.color = Colors.black, super.key});

  final String text;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18, color: color),
    );
  }
}
