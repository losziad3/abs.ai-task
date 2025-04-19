import 'package:firebase_auth/firebase_auth.dart';

abstract class LoginState {}

class LoginInitialState extends LoginState {}

class LoginLoadingState extends LoginState {}

class LoginSuccessState extends LoginState {
  final User user;
  LoginSuccessState(this.user);
}

class LoginFailureState extends LoginState {
  final String error;
  LoginFailureState(this.error);
}
