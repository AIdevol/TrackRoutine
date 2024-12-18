part of 'manage_profile_screen_bloc.dart';

@immutable
sealed class ManageProfileScreenEvent {}

class FullNameChangedEvent extends ManageProfileScreenEvent {
  final String fullName;

  FullNameChangedEvent({required this.fullName});
}

class PickProfilePictureEvent extends ManageProfileScreenEvent {}

class UpdateProfileEvent extends ManageProfileScreenEvent {}
