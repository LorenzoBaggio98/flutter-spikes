import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Welcome',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),

      // Scaffold
      home: Scaffold(

        // APP BAR DELLA PAGINA
        appBar: AppBar(
          title: Text("Title"),
        ),

        body: Center(
          child: Text("Hello World !"),
        ),


      ),

    );
  }
}
