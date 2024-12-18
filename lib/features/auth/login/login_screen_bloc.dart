import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../../../constants/enum.dart';

part 'login_screen_event.dart';
part 'login_screen_state.dart';

class LoginScreenBloc extends Bloc<LoginScreenEvent, LoginScreenState> {
  LoginScreenBloc() : super(const LoginScreenState()) {
    on<EmailChangedEvent>(_onEmailChanged);
    on<PasswordChangedEvent>(_onPasswordChanged);
    on<LoginSubmittedEvent>(_onLoginSubmitted);
  }

  void _onEmailChanged(EmailChangedEvent event, Emitter<LoginScreenState> emit) {
    emit(state.copyWith(email: event.email));
  }

  void _onPasswordChanged(PasswordChangedEvent event, Emitter<LoginScreenState> emit) {
    emit(state.copyWith(password: event.password));
  }

  void _onLoginSubmitted(LoginSubmittedEvent event, Emitter<LoginScreenState> emit) async {
    // Validate inputs
    if (state.email.isEmpty || state.password.isEmpty) {
      emit(state.copyWith(status: LoginStatus.failure));
      return;
    }

    try {
      emit(state.copyWith(status: LoginStatus.loading));

      // TODO: Implement actual login logic here
      // For example, call an authentication service
      // await authService.login(state.email, state.password);

      // Simulate network delay
      await Future.delayed(const Duration(seconds: 2));

      emit(state.copyWith(status: LoginStatus.success));
    } catch (error) {
      emit(state.copyWith(status: LoginStatus.failure));
    }
  }
}
