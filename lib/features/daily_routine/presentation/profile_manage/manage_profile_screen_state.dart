part of 'manage_profile_screen_bloc.dart';

@immutable
class ManageProfileScreenState {
  final String fullName;
  final String email;
  final File? profilePicture;
  final ProfileStatus status;
  final String? errorMessage;

  const ManageProfileScreenState({
    this.fullName = '',
    this.email = '',
    this.profilePicture,
    this.status = ProfileStatus.initial,
    this.errorMessage,
  });

  ManageProfileScreenState copyWith({
    String? fullName,
    String? email,
    File? profilePicture,
    ProfileStatus? status,
    String? errorMessage,
  }) {
    return ManageProfileScreenState(
      fullName: fullName ?? this.fullName,
      email: email ?? this.email,
      profilePicture: profilePicture ?? this.profilePicture,
      status: status ?? this.status,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}

final class ManageProfileScreenInitial extends ManageProfileScreenState {}