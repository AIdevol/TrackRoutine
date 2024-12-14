import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'suggetions_settings_event.dart';
part 'suggetions_settings_state.dart';

class SuggetionsSettingsBloc extends Bloc<SuggetionsSettingsEvent, SuggetionsSettingsState> {
  SuggetionsSettingsBloc() : super(SuggetionsSettingsInitial()) {
    on<SuggetionsSettingsEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
