import 'package:flutter/material.dart';

void main() => runApp(MyApp());

///Per inserire un'immagine bisogna creare una cartella assets dove inserire
///i file, inoltre per poterle usare bisogna modificare il file pubspec.yaml :
///   flutter:
///     assets:
///       - assets/
///
/// https://flutter.io/docs/development/ui/assets-and-images
class MyApp extends StatelessWidget {

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Background",
      home: Scaffold(

        appBar: AppBar(
          title: Text("Image"),
        ),

        body: Container(
          child: Center(
            child: Image.asset(
              'assets/images/lake.jpg',
              width: 600.0,
              height: 240.0,
              fit: BoxFit.cover,
            ),
          ),
        )

      ),
    );
  }
}

