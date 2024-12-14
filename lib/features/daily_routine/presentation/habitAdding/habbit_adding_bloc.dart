import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'habbit_adding_event.dart';
part 'habbit_adding_state.dart';

class HabbitAddingBloc extends Bloc<HabbitAddingEvent, HabbitAddingState> {
  HabbitAddingBloc() : super(HabbitAddingInitial()) {
    on<HabbitAddingEvent>((event, emit) {
      // TODO: implement event handler
    });
    on<IncreaseValueEvent>((event, emit) {
      _currentValue++;
      emit(HabbitAddingValue(_currentValue));
    });

    on<DecreaseValueEvent>((event, emit) {
      if (_currentValue > 0) {
        _currentValue--;
        emit(HabbitAddingValue(_currentValue));
      }
    });
  }

  int _currentValue = 0;

}
