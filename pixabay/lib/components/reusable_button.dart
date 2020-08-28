import 'package:flutter/material.dart';

class ReusableButton extends StatelessWidget {
  final Function onPress;
  final String text;

  ReusableButton({this.text, this.onPress});

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      child: Text(text),
      onPressed: onPress,
    );
  }
}
