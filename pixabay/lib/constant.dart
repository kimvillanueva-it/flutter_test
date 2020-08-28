import 'package:flutter/material.dart';
import 'package:pixabay/components/alert_listTile.dart';

List<Widget> drawerList(context) {
  FlatButton fb = FlatButton(
    child: Text('OK'),
    onPressed: () => Navigator.pop(context),
  );
  return [
    AlertListTile(
      title: 'item 1',
      content: Text('You have clicked Item 1'),
      leading: Icon(Icons.account_circle),
      children: [fb],
    ),
    AlertListTile(
      title: 'item 2',
      content: Text('You have clicked Item 2'),
      leading: Icon(Icons.account_circle),
      children: [fb],
    ),
    AlertListTile(
      title: 'item 3',
      content: Text('You have clicked Item 3'),
      leading: Icon(Icons.account_circle),
      children: [fb],
    ),
    AlertListTile(
      title: 'item 4',
      content: Text('You have clicked Item 4'),
      leading: Icon(Icons.account_circle),
      children: [fb],
    ),
    AlertListTile(
      title: 'item 5',
      content: Text('You have clicked Item 5'),
      leading: Icon(Icons.account_circle),
      children: [fb],
    ),
  ];
}

final String API_KEY = '18067643-66520af2153cb9e7f0a57d921';
