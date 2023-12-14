import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:firebase_auth/firebase_auth.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

  Future<void> registerUser(
      {required String email, required String password}) async {
    emit(LoginLoading());
    var auth = FirebaseAuth.instance;
    try {
      UserCredential user = await auth.signInWithEmailAndPassword(
          email: email, password: password);
      emit(LoginSuccess());
    } on Exception catch (e) {
      emit(LoginFailure());
    }
  }
}
