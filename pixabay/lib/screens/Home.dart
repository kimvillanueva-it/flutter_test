import 'dart:io';
import 'package:flutter/material.dart';
import 'package:pixabay/components/alert_listTile.dart';
import 'package:pixabay/constant.dart';
import 'package:pixabay/brain.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Brain b = new Brain();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pixabay'),
        centerTitle: true,
      ),
      drawer: Drawer(
        elevation: 2.0,
        child: ListView(
          children: drawerList(context),
        ),
      ),
      body: SizedBox.expand(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: FileImage(
                File(b.getImagePath()),
              ),
              fit: BoxFit.contain,
            ),
          ),
          child: ListView.builder(
              addAutomaticKeepAlives: false,
              itemCount: b.getLength(),
              itemBuilder: (BuildContext context, int i) {
                return Padding(
                  padding: EdgeInsets.symmetric(vertical: 8.0),
                  child: AlertListTile(
                    title: b.getId(i).toString(),
                    leading: SizedBox(
                      width: 50,
                      height: 50,
                      child: Image.network(
                        b.getPreviewUrl(i),
                      ),
                    ),
                    content: SizedBox(
                      width: 200,
                      height: 200,
                      child: GestureDetector(
                        onTap: () async {
                          Navigator.pop(
                              context); // I have to pop it right away and just let it run on the background, cause what happens is if i place it below and when you close the Alert first, it Pops the Home screen.
                          await b.downloadImage(b.getPreviewUrl(i));
                          setState(() {});
                        },
                        child: Image.network(
                          b.getPreviewUrl(i),
                        ),
                      ),
                    ),
                    children: <Widget>[
                      FlatButton(
                        child: Text('Download & Set wallpaper'),
                        onPressed: () async {
                          Navigator.pop(context);
                          await b.downloadImage(b.getPreviewUrl(i));
                          setState(() {});
                        },
                      ),
                      FlatButton(
                        child: Text('Close'),
                        onPressed: () => Navigator.pop(context),
                      ),
                    ],
                  ),
                );
              }),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.get_app),
        onPressed: () async {
          await b.newList(context);
          setState(() {});
        },
      ),
    );
  }
}
