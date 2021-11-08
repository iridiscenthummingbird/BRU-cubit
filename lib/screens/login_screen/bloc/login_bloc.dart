import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginInitial()) {
    on<LoginEvent>((event, emit) async {});
  }
  Future<bool> verifyUser(
      String email, String password, BuildContext context) async {
    emit(LoginWait());
    await Future.delayed(const Duration(seconds: 3));
    if (email == 'flutter.school@gmail.com') {
      if (password == 'Bestee5') {
        return true;
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
    return false;
  }
}
