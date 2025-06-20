import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/weather.dart';

class WeatherService {
  static const String apiKey = "dccad35e57720f24ef3561c2b7e7fcea";
  static const String baseUrl =
      "https://api.openweathermap.org/data/2.5/weather";

  Future<Weather?> fetchWeather(double latitude, double longitude) async {
    final url = Uri.parse(
      "$baseUrl?lat=$latitude&lon=$longitude&appid=$apiKey&units=metric&lang=ru",
    );

    final response = await http.get(url);

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body);
      return Weather.fromJson(data);
    } else {
      return null;
    }
  }
}
