part of 'login_screen_bloc.dart';

@immutable
abstract class LoginScreenEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class EmailChangedEvent extends LoginScreenEvent {
  final String email;

  EmailChangedEvent({required this.email});

  @override
  List<Object> get props => [email];
}

class PasswordChangedEvent extends LoginScreenEvent {
  final String password;

  PasswordChangedEvent({required this.password});

  @override
  List<Object> get props => [password];
}

class LoginSubmittedEvent extends LoginScreenEvent {}

