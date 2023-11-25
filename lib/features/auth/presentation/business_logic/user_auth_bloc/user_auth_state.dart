part of 'user_auth_bloc.dart';

abstract class UserAuthState extends Equatable {
  const UserAuthState();
}

class UserAuthInitial extends UserAuthState {
  @override
  List<Object> get props => [];
}

class UserAuthLoginSuccess extends UserAuthState {
  @override
  List<Object> get props => [];
}

class UserAuthLoginFailed extends UserAuthState {
  @override
  List<Object> get props => [];
}

class UserAuthSignupSuccess extends UserAuthState {
  @override
  List<Object> get props => [];
}

class UserAuthSignupFailed extends UserAuthState {
  @override
  List<Object> get props => [];
}

class UserAuthSignOutSuccess extends UserAuthState {
  @override
  List<Object> get props => [];
}

class UserAuthError extends UserAuthState {
  @override
  List<Object> get props => [];
}
