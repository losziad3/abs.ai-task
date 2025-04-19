import 'package:absai/features/auth/cubit/states.dart';
import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitialState());

  Future<User?> login(String email, String password) async {
    emit(LoginLoadingState());
    try {
      UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      emit(LoginSuccessState(userCredential.user!));
      return userCredential.user;
    } catch (e) {
      emit(LoginFailureState(e.toString()));
    }
    return null;
  }
}
