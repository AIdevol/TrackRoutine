// splash_screen_state.dart
part of 'splash_screen_bloc.dart';

@immutable
sealed class SplashScreenState {}

final class SplashScreenInitial extends SplashScreenState {}

final class SplashScreenAuthenticated extends SplashScreenState {}

final class SplashScreenUnauthenticated extends SplashScreenState {}

final class SplashScreenError extends SplashScreenState {
  final String errorMessage;

  SplashScreenError(this.errorMessage);
}