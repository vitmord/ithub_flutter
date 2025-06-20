import 'dart:io';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'user_event.dart';
import 'user_state.dart';
import '../../models/user.dart';
import '../../repositories/user_repository.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final UserRepository userRepository;

  UserBloc(this.userRepository) : super(UserInitial()) {
    on<LoadUser>((event, emit) async {
      emit(UserLoading());
      try {
        // Загружаем только из локального хранилища
        User? user = await userRepository.loadUser();
        if (user == null) {
          user = User(
            id: '',
            firstName: '',
            lastName: '',
            location: '',
            avatarUrl: '',
          );
        }
        emit(UserLoaded(user));
      } catch (e) {
        emit(UserError("Ошибка загрузки пользователя"));
      }
    });

    on<UpdateUser>((event, emit) async {
      if (state is UserLoaded) {
        final user = (state as UserLoaded).user.copyWith(
          firstName: event.firstName,
          lastName: event.lastName,
          location: event.location,
        );
        await userRepository.saveUser(user);
        emit(UserLoaded(user));
      }
    });

    on<UpdateUserPhoto>((event, emit) async {
      if (state is UserLoaded) {
        // Просто сохраняем фото локально (или игнорируем, если нет реализации)
        final user = (state as UserLoaded).user;
        await userRepository.saveUser(user);
        emit(UserLoaded(user));
      }
    });
  }
}
