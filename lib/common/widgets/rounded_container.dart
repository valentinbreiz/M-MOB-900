import 'package:flutter/material.dart';

class RoundedContainer extends StatelessWidget {
  RoundedContainer({required this.child, super.key});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8),
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 2,
            blurRadius: 7,
            offset: const Offset(5, 5),
          ),
        ],
        color: Colors.white,
        border: Border.all(color: Colors.grey[100]!, width: 3),
      ),
      child: child,
    );
  }
}
