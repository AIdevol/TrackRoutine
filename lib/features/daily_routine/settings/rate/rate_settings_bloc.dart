import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'rate_settings_event.dart';
part 'rate_settings_state.dart';

class RateSettingsBloc extends Bloc<RateSettingsEvent, RateSettingsState> {
  RateSettingsBloc() : super(RateSettingsInitial()) {
    on<RateSettingsEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
