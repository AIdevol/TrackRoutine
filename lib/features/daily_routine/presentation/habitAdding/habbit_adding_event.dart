part of 'habbit_adding_bloc.dart';

@immutable
sealed class HabbitAddingEvent {}

class IncreaseValueEvent extends HabbitAddingEvent {}

class DecreaseValueEvent extends HabbitAddingEvent {}
