part of 'home_screen_bloc.dart';

@immutable
sealed class HomeScreenState {}

final class HomeScreenInitial extends HomeScreenState {}

final class HomeScreenLoading extends HomeScreenState {}

final class HomeScreenLoaded extends HomeScreenState {
  final Widget data;
  HomeScreenLoaded(this.data);
}

final class HomeScreenError extends HomeScreenState {
  final String errorMessage;
  HomeScreenError(this.errorMessage);
}
