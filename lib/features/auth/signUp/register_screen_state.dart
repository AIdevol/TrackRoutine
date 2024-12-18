part of 'register_screen_bloc.dart';

@immutable
// sealed class RegisterScreenState {}

final class RegisterScreenInitial extends RegisterScreenState {}

class RegisterScreenState extends Equatable {
  final String fullName;
  final String email;
  final String password;
  final String confirmPassword;
  final RegisterStatus status;

  const RegisterScreenState({
    this.fullName = '',
    this.email = '',
    this.password = '',
    this.confirmPassword = '',
    this.status = RegisterStatus.initial,
  });

  RegisterScreenState copyWith({
    String? fullName,
    String? email,
    String? password,
    String? confirmPassword,
    RegisterStatus? status,
  }) {
    return RegisterScreenState(
      fullName: fullName ?? this.fullName,
      email: email ?? this.email,
      password: password ?? this.password,
      confirmPassword: confirmPassword ?? this.confirmPassword,
      status: status ?? this.status,
    );
  }

  @override
  List<Object?> get props => [fullName, email, password, confirmPassword, status];
}