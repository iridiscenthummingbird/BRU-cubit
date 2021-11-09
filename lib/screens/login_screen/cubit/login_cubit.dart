import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

  Future<void> onLoginAutorization(
      String email, String password, BuildContext context) async {
    emit(LoginWait());
    await Future.delayed(const Duration(seconds: 3));
    if (email == 'flutter.school@gmail.com') {
      if (password == 'Bestee5') {
        emit(LoginToHome());
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text("Wrong password!"),
            duration: Duration(seconds: 3),
          ),
        );
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("No user with this email!"),
          duration: Duration(seconds: 3),
        ),
      );
    }
    emit(LoginInitial());
  }
}
