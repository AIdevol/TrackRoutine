import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'privacy_settings_event.dart';
part 'privacy_settings_state.dart';

class PrivacySettingsBloc extends Bloc<PrivacySettingsEvent, PrivacySettingsState> {
  PrivacySettingsBloc() : super(PrivacySettingsInitial()) {
    on<PrivacySettingsEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}