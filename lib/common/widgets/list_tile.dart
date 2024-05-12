import 'package:flutter/material.dart';

class NewListTile extends StatelessWidget {
  NewListTile({
    required this.icon,
    required this.title,
    required this.callback,
    this.subTitle = '',
    this.size = 28,
    super.key,
  });

  final IconData icon;
  final String title;
  final String subTitle;
  final VoidCallback callback;
  final double size;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(
        icon,
        size: size,
      ),
      title: Text(title),
      subtitle: subTitle.isNotEmpty ? Text(subTitle) : null,
      onTap: callback,
    );
  }
}
