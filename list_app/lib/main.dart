import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ListExamplePage(),
    );
  }
}

class ListExamplePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    // ListTile.divideTiles adds divider between elements in a list
    // https://docs.flutter.io/flutter/material/ListTile/divideTiles.html
    var dividedWidgetList = ListTile.divideTiles(
      context: context,
      tiles: _getListData(),
      color: Colors.red
    ).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text('List Example'),
      ),
      body: ListView(
        children: dividedWidgetList
      )
    );
  }

  _getListData() {
    List<Widget> widgets = [];
    for (int i=0; i<100; i++) {
      widgets.add(
         Padding(
          padding: EdgeInsets.all(10.0),
          child: Text('Row $i'))
      );
    }
    return widgets;
  }
}