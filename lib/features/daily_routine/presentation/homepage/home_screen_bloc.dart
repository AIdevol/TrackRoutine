import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'home_screen_event.dart';
part 'home_screen_state.dart';

class HomeScreenBloc extends Bloc<HomeScreenEvent, HomeScreenState> {
  HomeScreenBloc() : super(HomeScreenInitial()) {
    on<LoadHomeData>((event, emit) async {
      emit(HomeScreenLoading()); // Emit loading state
      await Future.delayed(const Duration(seconds: 2)); // Simulate delay

      // try {
      //   final data = MainView();
      //   emit(HomeScreenLoaded(data)); // Emit loaded state
      // } catch (e) {
      //   emit(HomeScreenError("Failed to load data"));
      // }
    });
  }
}

class MainView extends StatelessWidget {
  const MainView({super.key});

  @override
  Widget build(BuildContext context) {
    return  _mainView(context);
  }
}

Widget _mainView(BuildContext context){
  return Column(
    children: [

    ],);
}
