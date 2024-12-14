import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'register_screen_event.dart';
part 'register_screen_state.dart';

class RegisterScreenBloc extends Bloc<RegisterScreenEvent, RegisterScreenState> {
  RegisterScreenBloc() : super(RegisterScreenInitial()) {
    on<RegisterScreenEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
