part of 'general_settings_bloc.dart';

@immutable
abstract class GeneralSettingsState {
  final bool isSundayStart;

  const GeneralSettingsState({this.isSundayStart = true});
}

class GeneralSettingsInitial extends GeneralSettingsState {
  const GeneralSettingsInitial({super.isSundayStart});
}

class GeneralSettingsLoaded extends GeneralSettingsState {
  const GeneralSettingsLoaded({required super.isSundayStart});

  GeneralSettingsLoaded copyWith({bool? isSundayStart}) {
    return GeneralSettingsLoaded(
      isSundayStart: isSundayStart ?? this.isSundayStart,
    );
  }
}