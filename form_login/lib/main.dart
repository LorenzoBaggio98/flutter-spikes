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
      home: FormLoginPage(),
    );
  }
}

class FormLoginPage extends StatefulWidget {
  FormLoginPage();

  @override
  _FormLoginPageState createState() => _FormLoginPageState();
}

class _FormLoginPageState extends State<FormLoginPage> {

  //Use to retrieve the current value of the TextField
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  //Unique identify the Form widget
  final _formKey = GlobalKey<FormState>();


  String _validateUsername(){

  }


  @override
  void dispose() {
    //Clean up the controller when the widget is disposed
    usernameController.dispose();
    passwordController.dispose();

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
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[

                Flexible(
                  child: Text("Username : ")),

                Flexible(
                  child: TextFormField(
                    validator: (value) {
                      if (value.length < 3 ) {
                        return 'Too short';
                      }
                    },

                    controller: usernameController,
                  ),)

              ],
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[

                Flexible(
                  child: Text("Password : ")),

                Flexible(
                  child: TextFormField(

                    obscureText: true,

                    validator: (value) {
                      if (value.length < 8 ) {
                        return 'Password too short';
                      }
                    },

                    controller: passwordController,
                  ),)

              ],
            ),

            RaisedButton(
              // When the user presses the button, show an alert dialog with the
              // text the user has typed into our text field.

              child: Text("Login"),

              onPressed: () {

                //only if form is valid
                if (_formKey.currentState.validate()) {

                  return showDialog(

                    context: context,
                    builder: (context) {
                      return AlertDialog(

                        // Retrieve the text the user has typed in using our
                        // TextEditingController
                        content: Text(usernameController.text),
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
