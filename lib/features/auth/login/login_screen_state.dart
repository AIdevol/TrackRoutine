part of 'login_screen_bloc.dart';

@immutable

final class LoginScreenInitial extends LoginScreenState {}
class LoginScreenState extends Equatable {
  final String email;
  final String password;
  final LoginStatus status;

  const LoginScreenState({
    this.email = '',
    this.password = '',
    this.status = LoginStatus.initial,
  });

  LoginScreenState copyWith({
    String? email,
    String? password,
    LoginStatus? status,
  }) {
    return LoginScreenState(
      email: email ?? this.email,
      password: password ?? this.password,
      status: status ?? this.status,
    );
  }

  @override
  List<Object> get props => [email, password, status];
}