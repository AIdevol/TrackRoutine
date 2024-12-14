part of 'habbit_adding_bloc.dart';

@immutable
sealed class HabbitAddingState {}

final class HabbitAddingInitial extends HabbitAddingState {}

final class HabbitAddingValue extends HabbitAddingState {
  final int value;

  HabbitAddingValue(this.value);
}
