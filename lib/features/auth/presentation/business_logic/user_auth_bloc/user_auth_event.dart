part of 'user_auth_bloc.dart';

abstract class UserAuthEvent extends Equatable {
  const UserAuthEvent();
}

class UserAuthEventLogin extends UserAuthEvent {
  final String email;
  final String password;

  const UserAuthEventLogin({required this.email, required this.password});

  @override
  List<Object?> get props => [email, password];
}

class UserAuthEventSignUp extends UserAuthEvent {
  final String email;
  final String password;

  const UserAuthEventSignUp({required this.email, required this.password});

  @override
  List<Object?> get props => [email, password];
}

class UserAuthEventSignOut extends UserAuthEvent {
  @override
  List<Object?> get props => [];
}
