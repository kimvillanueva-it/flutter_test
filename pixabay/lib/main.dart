import 'package:flutter/material.dart';
import 'constant.dart';
import 'package:pixabay/brain.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pixabay',
      home: Home(),
    );
  }
}

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
          children: drawerList,
        ),
      ),
      body: SizedBox.expand(
        child: Container(
          child: ListView.builder(
              addAutomaticKeepAlives: false,
              itemCount: b.getLength(),
              itemBuilder: (BuildContext context, int index) {
                return b.getIndex(index);
              }),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.get_app),
        onPressed: () async {
          await b.newList();
          setState(() {});
        },
      ),
    );
  }
}
