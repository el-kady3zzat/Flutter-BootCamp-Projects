part of 'auth_bloc.dart';

@immutable
abstract class AuthState {}

class AuthInitial extends AuthState {}

////////////////////////////////////////////////////////////////////////////////

class RegisterState extends AuthState {}

class RegisterSuccessState extends AuthState {}

class RegisterErrorState extends AuthState {
  final String errorMsg;
  RegisterErrorState({required this.errorMsg});
}

////////////////////////////////////////////////////////////////////////////////

class LoginState extends AuthState {}

class LoginSuccessState extends AuthState {}

class LoginErrorState extends AuthState {
  final String errorMsg;
  LoginErrorState({required this.errorMsg});
}
