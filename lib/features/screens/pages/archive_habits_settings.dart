import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trackroutine/features/daily_routine/settings/archive_habits/archive_habits_settings_bloc.dart';

import '../../../constants/colors.dart';

class ArchivedHabits extends StatelessWidget {
  const ArchivedHabits({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(create: (context)=>ArchiveHabitsSettingsBloc(),
      child: BlocBuilder<ArchiveHabitsSettingsBloc,ArchiveHabitsSettingsState>(builder: (context,state)=>
      Scaffold(
        appBar: AppBar(
          title: Text("Archived Habbits",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
          leading: InkWell(
            onTap: () => Navigator.of(context).pop(),
            child: Icon(
              Icons.arrow_back_ios,
              color: kPrimarykColors,
            ),
          ),

        ),
      )),);
  }
}
