import '../models/weather.dart';
import '../services/weather_service.dart';
import '../services/local_storage_service.dart';

class WeatherRepository {
  final WeatherService weatherService;

  WeatherRepository({required this.weatherService});

  Future<Weather> getWeather(double latitude, double longitude) async {
    // Сначала пытаемся получить сохраненные данные
    final savedWeather = await LocalStorageService.getWeather();
    if (savedWeather != null) {
      return savedWeather;
    }

    // Если сохраненных данных нет или они устарели, получаем новые
    final weather = await weatherService.fetchWeather(latitude, longitude);
    if (weather == null) {
      throw Exception("Ошибка загрузки погоды: пустой ответ от API");
    }

    // Сохраняем полученные данные
    await LocalStorageService.saveWeather(weather);
    return weather;
  }
}
