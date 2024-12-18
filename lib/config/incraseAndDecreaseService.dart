import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trackroutine/features/daily_routine/presentation/habitAdding/habbit_adding_bloc.dart';

import '../constants/colors.dart';

class HabitFrequencyCounter extends StatelessWidget {
  final String habitName;

  const HabitFrequencyCounter({
    Key? key,
    required this.habitName
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => HabbitAddingBloc(),
      child: Container(
       decoration: BoxDecoration(
         borderRadius: BorderRadius.circular(10),
         color: kSeconderyColors,
         boxShadow: [
           BoxShadow(
             color: Colors.grey.withOpacity(0.1),
             spreadRadius: 1,
             blurRadius: 5,
             offset: Offset(0, 3),)
         ]
       ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
          child: BlocBuilder<HabbitAddingBloc, HabbitAddingState>(
            builder: (context, state) {
              final value = state is HabbitAddingValue ? state.value : 0;

              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Decrease Button
                  _buildActionButton(
                    icon: Icons.remove,
                    onPressed: () => context.read<HabbitAddingBloc>().add(DecreaseValueEvent()),
                    backgroundColor: Colors.red.shade50,
                    iconColor: Colors.red.shade300,
                  ),

                  // Value Display
                  Expanded(
                    child: Column(
                      children: [
                        Text(
                          habitName,
                          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                            fontWeight: FontWeight.w600,
                            color: Colors.black87,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Container(
                          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                          decoration: BoxDecoration(
                            color: kSeconderyColors,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Text(
                            "$value/Day",
                            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                              fontWeight: FontWeight.bold,
                              color: kMutedNavyBlue,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  // Increase Button
                  _buildActionButton(
                    icon: Icons.add,
                    onPressed: () => context.read<HabbitAddingBloc>().add(IncreaseValueEvent()),
                    backgroundColor: Colors.green.shade50,
                    iconColor: Colors.green.shade300,
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }

  // Helper method to create consistent action buttons
  Widget _buildActionButton({
    required IconData icon,
    required VoidCallback onPressed,
    required Color backgroundColor,
    required Color iconColor,
  }) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8),
      decoration: BoxDecoration(
        color: backgroundColor,
        shape: BoxShape.circle,
      ),
      child: IconButton(
        icon: Icon(icon, color: iconColor),
        onPressed: onPressed,
        visualDensity: VisualDensity.compact,
      ),
    );
  }
}

