part of 'register_screen_bloc.dart';

// Events
abstract class RegisterScreenEvent {}

class FullNameChangedEvent extends RegisterScreenEvent {
  final String fullName;
  FullNameChangedEvent({required this.fullName});
}

class EmailChangedEvent extends RegisterScreenEvent {
  final String email;
  EmailChangedEvent({required this.email});
}

class PasswordChangedEvent extends RegisterScreenEvent {
  final String password;
  PasswordChangedEvent({required this.password});
}

class ConfirmPasswordChangedEvent extends RegisterScreenEvent {
  final String confirmPassword;
  ConfirmPasswordChangedEvent({required this.confirmPassword});
}

class RegisterSubmittedEvent extends RegisterScreenEvent {}