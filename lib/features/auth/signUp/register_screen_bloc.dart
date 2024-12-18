import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../../../constants/enum.dart';

part 'register_screen_event.dart';
part 'register_screen_state.dart';

// BLoC
class RegisterScreenBloc extends Bloc<RegisterScreenEvent, RegisterScreenState> {
  RegisterScreenBloc() : super(const RegisterScreenState()) {
    on<FullNameChangedEvent>((event, emit) {
      emit(state.copyWith(fullName: event.fullName));
    });

    on<EmailChangedEvent>((event, emit) {
      emit(state.copyWith(email: event.email));
    });

    on<PasswordChangedEvent>((event, emit) {
      emit(state.copyWith(password: event.password));
    });

    on<ConfirmPasswordChangedEvent>((event, emit) {
      emit(state.copyWith(confirmPassword: event.confirmPassword));
    });

    on<RegisterSubmittedEvent>((event, emit) async {
      // Validate inputs
      if (!_validateInputs()) {
        emit(state.copyWith(status: RegisterStatus.failure));
        return;
      }

      try {
        emit(state.copyWith(status: RegisterStatus.loading));

        // TODO: Add actual registration logic (e.g., API call)
        await Future.delayed(const Duration(seconds: 2)); // Simulate network request

        emit(state.copyWith(status: RegisterStatus.success));
      } catch (e) {
        emit(state.copyWith(status: RegisterStatus.failure));
      }
    });
  }

  bool _validateInputs() {
    // Basic validation
    if (state.fullName.isEmpty) return false;
    if (state.email.isEmpty || !state.email.contains('@')) return false;
    if (state.password.length < 6) return false;
    if (state.password != state.confirmPassword) return false;

    return true;
  }
}

