import 'dart:io';
import 'package:bloc/bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meta/meta.dart';

import '../../../../constants/enum.dart';

part 'manage_profile_screen_event.dart';
part 'manage_profile_screen_state.dart';


class ManageProfileScreenBloc extends Bloc<ManageProfileScreenEvent, ManageProfileScreenState> {
  ManageProfileScreenBloc() : super(ManageProfileScreenInitial()) {
    on<FullNameChangedEvent>(_onFullNameChanged);
    on<PickProfilePictureEvent>(_onPickProfilePicture);
    on<UpdateProfileEvent>(_onUpdateProfile);
  }

  void _onFullNameChanged(FullNameChangedEvent event, Emitter<ManageProfileScreenState> emit) {
    // Validate full name if needed
    emit(state.copyWith(fullName: event.fullName));
  }

  Future<void> _onPickProfilePicture(
      PickProfilePictureEvent event,
      Emitter<ManageProfileScreenState> emit
      ) async {
    try {
      final picker = ImagePicker();
      final pickedFile = await picker.pickImage(source: ImageSource.gallery);

      if (pickedFile != null) {
        emit(state.copyWith(
            profilePicture: File(pickedFile.path),
            status: ProfileStatus.initial
        ));
      }
    } catch (e) {
      emit(state.copyWith(
          status: ProfileStatus.failure,
          errorMessage: 'Failed to pick profile picture'
      ));
    }
  }

  Future<void> _onUpdateProfile(
      UpdateProfileEvent event,
      Emitter<ManageProfileScreenState> emit
      ) async {
    // Validate inputs
    if (state.fullName.isEmpty) {
      emit(state.copyWith(
          status: ProfileStatus.failure,
          errorMessage: 'Full name cannot be empty'
      ));
      return;
    }

    try {
      // Emit loading state
      emit(state.copyWith(status: ProfileStatus.loading));

      // TODO: Implement actual profile update logic
      // This might involve calling an API, updating local storage, etc.
      await Future.delayed(const Duration(seconds: 2)); // Simulated network call

      // Simulate successful update
      emit(state.copyWith(status: ProfileStatus.success));
    } catch (e) {
      emit(state.copyWith(
          status: ProfileStatus.failure,
          errorMessage: 'Failed to update profile'
      ));
    }
  }
}