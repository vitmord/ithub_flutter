import 'package:new_weather_app/models/fake_user.dart';

List<FakeUser> fakeUsers = [
  FakeUser(
    name: "Александр Кузнецов",
    city: "Краснодар",
    avatarPath: "assets/avatar1.png",
    posts: [
      PostWithWeather(
        post: "Сегодня идеальный день для барбекю на даче!",
        weather: WeatherData(
          city: "Краснодар",
          temperature: "32°C",
          description: "Жарко",
        ),
      ),
      PostWithWeather(
        post: "Вечером можно выйти на пробежку, температура стала комфортной.",
        weather: WeatherData(
          city: "Краснодар",
          temperature: "25°C",
          description: "Теплый вечер",
        ),
      ),
    ],
  ),
  FakeUser(
    name: "Ольга Семенова",
    city: "Красноярск",
    avatarPath: "assets/avatar2.png",
    posts: [
      PostWithWeather(
        post: "Утро началось с легкого морозца, но днем обещают потепление.",
        weather: WeatherData(
          city: "Красноярск",
          temperature: "-2°C",
          description: "Морозно",
        ),
      ),
      PostWithWeather(
        post: "Отличный день для прогулки по набережной Енисея!",
        weather: WeatherData(
          city: "Красноярск",
          temperature: "5°C",
          description: "Солнечно",
        ),
      ),
    ],
  ),
  FakeUser(
    name: "Артем Соколов",
    city: "Ростов-на-Дону",
    avatarPath: "assets/avatar3.png",
    posts: [
      PostWithWeather(
        post: "Дон сегодня особенно красив в лучах заката.",
        weather: WeatherData(
          city: "Ростов-на-Дону",
          temperature: "22°C",
          description: "Ясно",
        ),
      ),
      PostWithWeather(
        post: "Утренний туман над рекой создает мистическую атмосферу.",
        weather: WeatherData(
          city: "Ростов-на-Дону",
          temperature: "18°C",
          description: "Туман",
        ),
      ),
    ],
  ),
  FakeUser(
    name: "Марина Петрова",
    city: "Нижний Новгород",
    avatarPath: "assets/avatar4.png",
    posts: [
      PostWithWeather(
        post: "Сегодня отличный день для прогулки по набережной Волги!",
        weather: WeatherData(
          city: "Нижний Новгород",
          temperature: "15°C",
          description: "Облачно",
        ),
      ),
      PostWithWeather(
        post: "Вечером обещают дождь, лучше взять зонт.",
        weather: WeatherData(
          city: "Нижний Новгород",
          temperature: "12°C",
          description: "Дождливо",
        ),
      ),
    ],
  ),
];
