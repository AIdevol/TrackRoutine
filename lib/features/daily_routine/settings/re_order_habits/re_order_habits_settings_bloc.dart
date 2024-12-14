import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 're_order_habits_settings_event.dart';
part 're_order_habits_settings_state.dart';

class ReOrderHabitsSettingsBloc extends Bloc<ReOrderHabitsSettingsEvent, ReOrderHabitsSettingsState> {
  ReOrderHabitsSettingsBloc() : super(ReOrderHabitsSettingsInitial()) {
    on<ReOrderHabitsSettingsEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
