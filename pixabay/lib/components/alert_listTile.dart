import 'package:flutter/material.dart';

class AlertListTile extends StatelessWidget {
  final String title;
  final Widget leading, content;

  AlertListTile({this.title, this.leading, this.content});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: leading,
      title: Text(title),
      onTap: () {
        showDialog(
          context: context,
          builder: (_) => AlertDialog(
            title: Center(child: Text(title)),
            content: content,
            actions: <Widget>[
              FlatButton(
                child: Text('OK'),
                onPressed: () => Navigator.pop(context),
              ),
            ],
          ),
        );
      },
    );
  }
}
