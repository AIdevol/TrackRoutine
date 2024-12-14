import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
part 'general_settings_event.dart';
part 'general_settings_state.dart';

class GeneralSettingsBloc extends Bloc<GeneralSettingsEvent, GeneralSettingsState> {
  GeneralSettingsBloc() : super(const GeneralSettingsInitial()) {
    on<ToggleWeekStartEvent>((event, emit) {
      // Ensure we're working with a loaded state or creating one
      final currentState = state is GeneralSettingsLoaded
          ? state as GeneralSettingsLoaded
          : const GeneralSettingsLoaded(isSundayStart: true);

      emit(currentState.copyWith(isSundayStart: event.isSundayStart));
    });
  }
}
