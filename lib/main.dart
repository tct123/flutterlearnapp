import 'package:flutter/material.dart';

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
              TextButton(onPressed: () => print(""), child: const Text("data")),
            ],
          ),
        ),
      ),
    ),
  );
}
