import 'dart:convert';

import 'package:myweaterapp/models/weather_model.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';
import 'package:http/http.dart' as http;

class WeatherService {
  static const baseURL = "https://api.openweathermap.org/data/2.5/weather";
  final String apikey;
  WeatherService(this.apikey);
  Future<Weather> getWeather(String cityName) async {
    final response = await http.get(
      Uri.parse('$baseURL?q=$cityName&appid=$apikey&units=metric'),
    );
    if (response.statusCode == 200) {
      return Weather.fromJSON(jsonDecode(response.body));
    } else {
      throw Exception("Failed to load weather data");
    }
  }

  Future<String?> getCurrentCity() async {
    // permission asking
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      Geolocator.requestPermission();
    }
    //fetch position
    Position position = await Geolocator.getCurrentPosition(
      locationSettings: LocationSettings(accuracy: LocationAccuracy.high),
    );
    List<Placemark> placemarks = await placemarkFromCoordinates(
      position.latitude,
      position.longitude,
    );
    String? city = placemarks[0].locality;
    return city;
  }
}
