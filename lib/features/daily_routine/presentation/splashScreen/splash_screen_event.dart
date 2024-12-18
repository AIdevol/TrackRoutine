// splash_screen_event.dart
part of 'splash_screen_bloc.dart';

@immutable
sealed class SplashScreenEvent {}

class InitializeSplashEvent extends SplashScreenEvent {}