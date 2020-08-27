import 'package:flutter/material.dart';
import 'package:pixabay/models/Hit.dart';
import 'package:pixabay/services/network.dart';
import 'models/Hit.dart';
import 'package:pixabay/components/alert_listTile.dart';

class Brain {
  Network n = new Network();
  List<Widget> _list = [
    Center(
      child: Text('Click on the Floating Action Button'),
    )
  ];

  Future<void> newList() async {
    List<Hit> list = await n.getList();
    _list.clear();
    list.forEach((item) {
      _list.add(
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: AlertListTile(
            title: item.getId().toString(),
            leading: SizedBox(
              width: 50,
              height: 50,
              child: Image.network(
                item.getPreviewURL(),
              ),
            ),
            content: SizedBox(
              width: 200,
              height: 200,
              child: Image.network(
                item.getPreviewURL(),
              ),
            ),
          ),
        ),
      );
    });
  }

  List getList() => _list;

  int getLength() => _list.length;

  Widget getIndex(int i) => _list[i];
}
