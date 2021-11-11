import 'package:bloc/bloc.dart';
import 'package:bru/repository/user_repository.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit({required this.userRepository}) : super(LoginInitial());

  final IUserRepository userRepository;

  Future<void> onLoginAutorization(
      String email, String password, BuildContext context) async {
    emit(LoginWait());
    bool result = await userRepository.loginUser(email, password);
    if (result) {
      emit(LoginToHome());
    }
    emit(LoginInitial());
  }
}
