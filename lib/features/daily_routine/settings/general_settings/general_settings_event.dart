part of 'general_settings_bloc.dart';

@immutable
sealed class GeneralSettingsEvent {
  const GeneralSettingsEvent();
}

class ToggleWeekStartEvent extends GeneralSettingsEvent {
  final bool isSundayStart;

  const ToggleWeekStartEvent({required this.isSundayStart});
}