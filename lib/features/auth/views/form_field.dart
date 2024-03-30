import 'package:flutter/material.dart';

class MyFormField extends StatelessWidget {
  const MyFormField(
      {super.key, required this.title, this.preIcon, this.sufIcon});
  final String title;
  final IconData? preIcon;
  final IconData? sufIcon;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        decoration: InputDecoration(
      prefixIcon: preIcon == null ? null : Icon(preIcon),
      suffixIcon: sufIcon == null ? null : Icon(sufIcon),
      labelText: title,
      border: const OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(10.0)),
      ),
    ));
  }
}
