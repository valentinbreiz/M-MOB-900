import 'package:flutter/material.dart';

class MyFormField extends StatelessWidget {
  const MyFormField({
    required this.title,
    this.preIcon,
    this.sufIcon,
    this.controller,
    this.initValue,
    super.key,
  });

  final String title;
  final IconData? preIcon;
  final IconData? sufIcon;
  final TextEditingController? controller;
  final String? initValue;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        prefixIcon: preIcon == null ? null : Icon(preIcon),
        suffixIcon: sufIcon == null ? null : Icon(sufIcon),
        labelText: title,
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
      ),
    );
  }
}
