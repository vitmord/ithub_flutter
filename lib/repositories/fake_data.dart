import 'fake_user.dart';

List<FakeUser> fakeUsers = [
  FakeUser(
    name: "Иван Петров",
    city: "Москва",
    avatarPath: "assets/avatars/avatar1.png",
    posts: [
      "Сегодня в Москве отличная погода, солнечно!",
      "Немного прохладно, но приятно гулять.",
    ],
  ),
  FakeUser(
    name: "Анастасия Смирнова",
    city: "Санкт-Петербург",
    avatarPath: "assets/avatars/avatar2.png",
    posts: ["В Питере как всегда дождь...", "Надеюсь, завтра будет солнце!"],
  ),
  FakeUser(
    name: "Алексей Козлов",
    city: "Казань",
    avatarPath: "assets/avatars/avatar3.png",
    posts: [
      "Жаркий день, пришлось спрятаться в тени.",
      "Жду прохлады вечером.",
    ],
  ),
  FakeUser(
    name: "Мария Иванова",
    city: "Новосибирск",
    avatarPath: "assets/avatars/avatar4.png",
    posts: ["Снегопад, но красиво!", "Тепло оделась, не замерзаю."],
  ),
];
