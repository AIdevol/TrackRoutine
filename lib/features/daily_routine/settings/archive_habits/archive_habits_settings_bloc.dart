import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'archive_habits_settings_event.dart';
part 'archive_habits_settings_state.dart';

class ArchiveHabitsSettingsBloc extends Bloc<ArchiveHabitsSettingsEvent, ArchiveHabitsSettingsState> {
  ArchiveHabitsSettingsBloc() : super(ArchiveHabitsSettingsInitial()) {
    on<ArchiveHabitsSettingsEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
