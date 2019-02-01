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
      home: FormPage(),
    );
  }
}

class FormPage extends StatefulWidget {
  FormPage();

  @override
  _FormPageState createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  //Use to retrieve the current value of the TextField
  final controller = TextEditingController();

  //Unique identify the Form widget
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    //Clean up the controller when the widget is disposed
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Retrieve Text Input'),
      ),

      body: Form(
        key: _formKey,

        child: Column(
          children: <Widget>[

            TextFormField(
              validator: (value) {
                if (value.length < 3 ) {
                  return 'Too short';
                }
              },

              controller: controller,
            ),

            RaisedButton(
              // When the user presses the button, show an alert dialog with the
              // text the user has typed into our text field.

              child: Text("Submit"),

              onPressed: () {

                //only if form is valid
                if (_formKey.currentState.validate()) {

                  return showDialog(

                    context: context,
                    builder: (context) {
                      return AlertDialog(

                        // Retrieve the text the user has typed in using our
                        // TextEditingController
                        content: Text(controller.text),
                      );
                    },
                  );
                }
              }
            ),
          ],
        ),
      ),
    );
  }
}
