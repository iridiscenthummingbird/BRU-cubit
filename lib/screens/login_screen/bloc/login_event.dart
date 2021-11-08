part of 'login_bloc.dart';

@immutable
abstract class LoginEvent {}

class LoginAuthorization extends LoginEvent {
  LoginAuthorization(
      {required String email,
      required String password,
      required BuildContext context})
      : _email = email,
        _password = password,
        _context = context;
  late final String _email;
  late final String _password;
  late final BuildContext _context;
}
