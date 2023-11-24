import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'user_auth_event.dart';

part 'user_auth_state.dart';

class UserAuthBloc extends Bloc<UserAuthEvent, UserAuthState> {
  UserAuthBloc() : super(UserAuthInitial()) {
    on<UserAuthEventLogin>(_onUserAuthEventLogin);
    on<UserAuthEventSignUp>(_onUserAuthEventSignup);
  }

  _onUserAuthEventLogin(
    UserAuthEventLogin event,
    Emitter<UserAuthState> emit,
  ) {}

  _onUserAuthEventSignup(
    UserAuthEventSignUp event,
    Emitter<UserAuthState> emit,
  ) {}
}
