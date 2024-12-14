import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trackroutine/features/daily_routine/presentation/habitAdding/habbit_adding_bloc.dart';

import '../constants/colors.dart';

class Incraseanddecreaseservice extends StatelessWidget {
  const Incraseanddecreaseservice({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => HabbitAddingBloc(),
      child: BlocBuilder<HabbitAddingBloc, HabbitAddingState>(
        builder: (_, state) {
          final value = state is HabbitAddingValue ? state.value : 0;

          return Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [

                SizedBox(
                  width: 280,
                  child: Container(
                    height: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: kSeconderyColors,
                    ),
                    child: TextField(
                      readOnly: true,
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(
                        hintText: "$value/Day",
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ),
                IconButton(

                  onPressed: () => context
                      .read<HabbitAddingBloc>()
                      .add(DecreaseValueEvent()),
                  icon: const Icon(Icons.remove),
                ),
                IconButton(
                  onPressed: () => context
                      .read<HabbitAddingBloc>()
                      .add(IncreaseValueEvent()),
                  icon: const Icon(Icons.add),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
