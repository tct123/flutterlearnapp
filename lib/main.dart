import 'package:flutter/material.dart';

var textfield = TextField();
var text = Text("");
void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text("Hello")),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const Text(
                "Hello world",
                style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold),
              ),
              text,
              textfield,
              TextButton(onPressed: () {}, child: const Text("Hello World")),
            ],
          ),
        ),
      ),
    ),
  );
}

class MyApp {
  const MyApp();
} // class for testing
