import 'package:edtech_app/log.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'user_auth_event.dart';

part 'user_auth_state.dart';

class UserAuthBloc extends Bloc<UserAuthEvent, UserAuthState> {
  UserAuthBloc({required this.log}) : super(UserAuthInitial()) {
    on<UserAuthEventLogin>(_onUserAuthEventLogin);
    on<UserAuthEventSignUp>(_onUserAuthEventSignup);
    on<UserAuthEventSignOut>(_onUserAuthEventSignOut);
  }

  final Log log;
  final _auth = FirebaseAuth.instance;

  _onUserAuthEventLogin(
    UserAuthEventLogin event,
    Emitter<UserAuthState> emit,
  ) async {
    emit(UserAuthInitial());
    try {
      final user = await _auth.signInWithEmailAndPassword(
        email: event.email.trim(),
        password: event.password.trim(),
      );
      if (user != null) {
        emit(UserAuthLoginSuccess());
      } else {
        emit(UserAuthLoginFailed());
      }
    } catch (e) {
      log.error(title: 'User Auth Bloc', msg: e.toString());
      emit(UserAuthError());
    }
  }

  _onUserAuthEventSignup(
    UserAuthEventSignUp event,
    Emitter<UserAuthState> emit,
  ) async {
    emit(UserAuthInitial());
    try {
      final user = await _auth.createUserWithEmailAndPassword(
        email: event.email.trim(),
        password: event.password.trim(),
      );
      if (user != null) {
        emit(UserAuthSignupSuccess());
      } else {
        emit(UserAuthSignupFailed());
      }
    } catch (e) {
      log.error(title: 'User Auth Bloc', msg: e.toString());
      emit(UserAuthError());
    }
  }

  _onUserAuthEventSignOut(
    UserAuthEventSignOut event,
    Emitter<UserAuthState> emit,
  ) async {
    emit(UserAuthInitial());
    try {
      await _auth.signOut();
      emit(UserAuthSignOutSuccess());
    } catch (e) {
      log.error(title: 'User Auth Bloc', msg: e.toString());
      emit(UserAuthError());
    }
  }
}
