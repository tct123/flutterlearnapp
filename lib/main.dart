import 'package:flutter/material.dart';
import 'package:myweaterapp/pages/weatherpage.dart';

var textfield = TextField();
var text = Text("");
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: WeatherPage());
  }
}
