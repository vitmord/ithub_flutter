import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/weather.dart';

class LocalStorageService {
  static const String _weatherKey = 'last_weather';
  static const String _lastUpdateKey = 'last_update';

  // Сохранение погоды
  static Future<void> saveWeather(Weather weather) async {
    final prefs = await SharedPreferences.getInstance();
    final weatherJson = jsonEncode({
      'city': weather.city,
      'temperature': weather.temperature,
      'description': weather.description,
    });
    await prefs.setString(_weatherKey, weatherJson);
    await prefs.setString(_lastUpdateKey, DateTime.now().toIso8601String());
  }

  // Получение сохраненной погоды
  static Future<Weather?> getWeather() async {
    final prefs = await SharedPreferences.getInstance();
    final weatherJson = prefs.getString(_weatherKey);
    final lastUpdate = prefs.getString(_lastUpdateKey);

    if (weatherJson != null && lastUpdate != null) {
      final weatherData = jsonDecode(weatherJson) as Map<String, dynamic>;
      final lastUpdateTime = DateTime.parse(lastUpdate);
      final now = DateTime.now();

      // Проверяем, не устарели ли данные (старше 30 минут)
      if (now.difference(lastUpdateTime).inMinutes < 30) {
        return Weather(
          city: weatherData['city'],
          temperature: weatherData['temperature'].toDouble(),
          description: weatherData['description'],
        );
      }
    }
    return null;
  }

  // Очистка сохраненных данных
  static Future<void> clearWeather() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_weatherKey);
    await prefs.remove(_lastUpdateKey);
  }

  static Future<void> saveString(String key, String value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(key, value);
  }

  static Future<String?> getString(String key) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(key);
  }

  static Future<void> remove(String key) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(key);
  }
}
