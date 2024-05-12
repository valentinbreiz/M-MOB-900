import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchBar extends StatelessWidget {
  const SearchBar({required this.text, super.key});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        children: <Widget>[
          const Icon(Icons.search),
          const SizedBox(width: 15),
          Text(text),
        ],
      ),
    );
  }
}
