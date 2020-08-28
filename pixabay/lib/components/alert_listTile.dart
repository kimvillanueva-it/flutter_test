import 'package:flutter/material.dart';

class AlertListTile extends StatelessWidget {
  final String title;
  final Widget leading, content;
  final List<Widget> children;

  AlertListTile({this.title, this.leading, this.content, this.children});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: leading,
      title: Text(
        title,
        style: TextStyle(
          color: Colors.teal,
          fontWeight: FontWeight.bold,
        ),
      ),
      onTap: () {
        showDialog(
          context: context,
          builder: (_) => AlertDialog(
            title: Center(child: Text(title)),
            content: content,
            actions: children,
          ),
        );
      },
    );
  }
}
