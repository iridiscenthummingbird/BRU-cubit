part of 'login_cubit.dart';

@immutable
abstract class LoginState {}

class LoginInitial extends LoginState {}

class LoginWait extends LoginState {}

class LoginToHome extends LoginState {}
