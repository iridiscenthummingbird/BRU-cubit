import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginInitial()) {
    on<LoginEvent>((event, emit) async {
      if (event is LoginAuthorization) {
        emit(LoginWait());
        await Future.delayed(const Duration(seconds: 3));
        _verifyUser(event._email, event._password, event._context)
            ? emit(LoginToHome())
            : emit(LoginInitial());
      }
    });
  }
  bool _verifyUser(String email, String password, BuildContext context) {
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
    return false;
  }
}
