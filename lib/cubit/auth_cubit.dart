import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(const AuthState.unauthenticated());

  void appStarted() async {
    try {
      Future.delayed(
        const Duration(
          seconds: 10,
        ),
        () {
          emit(const AuthState.authenticated());
        },
      );
    } catch (e) {
      emit(const AuthState.unauthenticated());
    }
  }
}
