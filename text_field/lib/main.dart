
import 'package:flutter/material.dart';

void main() {
  runApp(TextFieldExampleApp());
}

class TextFieldExampleApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      title: 'Flutter Multi-Line Text Field Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),

      home: Scaffold(
        resizeToAvoidBottomPadding: false,

        appBar: AppBar(
          title: const Text('Text Fields'),
        ),

        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SingleLineTextFieldWidget(),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: MultilineTextAndBtn(),
            ),
          ],
        ),

      ),
    );
  }
}

/// Single-line text field widget
class SingleLineTextFieldWidget extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(

      padding: const EdgeInsets.all(15.0),

      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.all(Radius.circular(10.0)),
      ),

      child: TextField(
        autocorrect: false, // turns off auto-correct
        decoration: InputDecoration(
          hintText: 'Enter text; return submits',
        ),

        //NEL CASO IL TESTO CAMBI VIENE MOSTRATO IN CONSOLE
        onChanged: (str) => print('Single-line text change: $str'),

        //NEL CASO SI CLICCHI INVIO (RETURN) VIENE MOSTRATA LA SNACK BAR
        onSubmitted: (str) => _showInSnackBar(context, '$str'),

      ),
    );
  }
}

/// Multi-line text field widget with a submit button
class MultilineTextAndBtn extends StatefulWidget {

  //COSTRUTTORE NEL CASO CI SIANO PARAMETRI NON INIZIALIZZATI, COME LE KEY
  MultilineTextAndBtn({Key key}) : super(key: key);

  @override
  createState() => _TextFieldAndButtonState();
}

class _TextFieldAndButtonState extends State<MultilineTextAndBtn> {

  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {

    return Container(
      padding: const EdgeInsets.all(15.0),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.all(Radius.circular(10.0)),
      ),

      //color: Colors.grey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          TextField(
            controller: _controller,
            maxLines: 10,
            decoration: InputDecoration(
              hintText: 'Enter text; return doesn\'t submit',
            ),


            onChanged: (str) => print('Multi-line text change: $str'),
            onSubmitted: (str) => print('This will not get called when return is pressed'),
          ),

          SizedBox(height: 10.0),
          FlatButton(
            onPressed: () => _showInSnackBar(
              context,
              '${_controller.text}',
            ),
            child: const Text('Submit'),
          ),
        ],
      ),
    );
  }
}

/// Displays text in a snackbar
_showInSnackBar(BuildContext context, String text) {
  Scaffold.of(context).showSnackBar(SnackBar(
    content: Text(text),
  ));
}
