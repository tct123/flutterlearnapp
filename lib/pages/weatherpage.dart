import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:myweaterapp/models/weather_model.dart';
import 'package:myweaterapp/service/weather_service.dart';

class WeatherPage extends StatefulWidget {
  const WeatherPage({super.key});

  @override
  State<StatefulWidget> createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {
  //apikey
  final _weatherService = WeatherService(apikey);
  Weather? _weather;
  //fetch Weather
  _fetchWeather() async {
    String city_name = await _weatherService.getCurrentCity();
    try{
      final weather=await _weatherService.getWeather(city_name)
      setState(() {
        _weather=weather;
      });
    }
    // errors
    catch (e){if (kDebugMode) {
      print(e);
    }}
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold();
  }
}
