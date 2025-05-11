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
  final _weatherService = WeatherService("035813f6422fcc8211320a8782dba03d");
  Weather? _weather;
  //fetch Weather
  _fetchWeather() async {
    String? cityName = await _weatherService.getCurrentCity();
    try {
      final weather = await _weatherService.getWeather(cityName!);
      setState(() {
        _weather = weather;
      });
    }
    // errors
    catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }

  @override
  void initState() {
    super.initState();
    _fetchWeather(); // fetch Weather
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (_weather != null) ...[
              // cityname
              Text(_weather!.cityName),
              // temperature
              Text('${_weather!.temprature.round()}°'),
            ] else ...[
              CircularProgressIndicator(),
              Text("Loading"),
            ],
          ],
        ),
      ),
    );
  }
}
