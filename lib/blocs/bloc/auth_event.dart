part of 'auth_bloc.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object> get props => [];
}

class AuthCheckEmail extends AuthEvent {
  final String email;

  const AuthCheckEmail(this.email);

  @override
  // TODO: implement props
  List<Object> get props => [email];
}

class AuthRegister extends AuthEvent {
  final SignupFormModel? data;

  const AuthRegister(this.data);

  @override
  // TODO: implement props
  List<Object> get props => [data!];
}

class AuthLogin extends AuthEvent {
  final SigninFormModel? data;

  const AuthLogin(this.data);

  @override
  // TODO: implement props
  List<Object> get props => [data!];
}

class AuthGetCurrentUser extends AuthEvent {}

class AuthUpdateUser extends AuthEvent {
  final UserEditFormModel? data;

  AuthUpdateUser(this.data);

  @override
  // TODO: implement props
  List<Object> get props => [data!];
}
