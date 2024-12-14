import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'import_data_settings_event.dart';
part 'import_data_settings_state.dart';

class ImportDataSettingsBloc extends Bloc<ImportDataSettingsEvent, ImportDataSettingsState> {
  ImportDataSettingsBloc() : super(ImportDataSettingsInitial()) {
    on<ImportDataSettingsEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
