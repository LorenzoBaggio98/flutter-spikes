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
          child: SelectionButton()
      ),
    );

  }
}

///BOTTONE CHE CHIAMA LO SCREEN E ASPETTA UN VALORE
class SelectionButton extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      onPressed: () {
        _wait(context);
      },
      child: Text('WAIT -->'),
    );
  }

  //funzione asincrona che aspetta un valore
  _wait(BuildContext context) async{

    final result = await Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => SecondScreen()
      ),
    );

    Scaffold.of(context)
      ..removeCurrentSnackBar()
      ..showSnackBar(SnackBar(content: Text("$result")));
  }
}


/// SCREEN CHE RITORNA IL VALORE
class SecondScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Second Screen"),
      ),

      body: Center(
        child: RaisedButton(

            child: Text("<-- RETURN"),
            onPressed: (){

              // VAI ALL'ALTRA PAGINA
              Navigator.pop(
                  context,
                  "SOMETHING"
              );
            }),

      ),
    );
  }
}
