import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: FirstScreen(),
    );
  }
}
class FirstScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("First Screen"),
      ),

      body: Center(
        child: RaisedButton(

            child: Text("Go -> "),
            onPressed: (){

              // VAI ALL'ALTRA PAGINA
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context)=> SecondScreen())
              );
            }),

      ),
    );
  }
}

class SecondScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Second Screen"),
      ),

      body: Center(
        child: RaisedButton(

            child: Text("<- Return"),
            onPressed: (){

              // RITORNA ALL'ALTRA PAGINA
              Navigator.pop(context);


            }),

      ),
    );
  }
}

