import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../constants/colors.dart';
import '../../daily_routine/settings/general_settings/general_settings_bloc.dart';

class GeneralViewScreen extends StatelessWidget {
  const GeneralViewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GeneralSettingsBloc(),
      child: Scaffold(
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              backgroundColor: CupertinoColors.white,
              title: Text("General",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
              leading: InkWell(
                onTap: () => Navigator.of(context).pop(),
                child: Icon(
                  Icons.arrow_back_ios,
                  color: kPrimarykColors,
                ),
              ),
              pinned: true,
              floating: true,
            ),
            SliverFillRemaining(
              hasScrollBody: false,
              child: Container(
                color: CupertinoColors.white,
                child: Center(
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.all(18.0),
                      child: Column(
                        children: [
                          _generalScreenWidget(context),
                          const SizedBox(height: 20),
                          _dashboardScreenWidget(context),
                         const SizedBox(height: 20),
                          // _generalScreenWidget(context),
                          // _generalScreenWidget(context),
                          // _generalScreenWidget(context),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget _generalScreenWidget(BuildContext context) {
  return BlocBuilder<GeneralSettingsBloc, GeneralSettingsState>(
    builder: (context, state) {
      bool isSundayStart = state.isSundayStart; // Replace with actual state property

      return Container(
        height: 240,
        width: 400,
        margin: const EdgeInsets.symmetric(vertical: 8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: kSeconderyColors,
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Week Starts on Monday",
                    style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
                  ),
                  Switch(
                    value: isSundayStart,
                    onChanged: (value) {
                      // Add an event to the bloc to handle the switch
                      context.read<GeneralSettingsBloc>().add(
                          ToggleWeekStartEvent(isSundayStart: value)
                      );
                    },
                  ),
                ],
              ),
              Divider(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Highlight current day",
                    style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
                  ),
                  Switch(
                    value: isSundayStart,
                    onChanged: (value) {
                      // Add an event to the bloc to handle the switch
                      context.read<GeneralSettingsBloc>().add(
                          ToggleWeekStartEvent(isSundayStart: value)
                      );
                    },
                  ),
                ],
              ),
              Divider(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Allow Crashlytics",
                    style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
                  ),
                  Switch(
                    value: isSundayStart,
                    onChanged: (value) {
                      // Add an event to the bloc to handle the switch
                      context.read<GeneralSettingsBloc>().add(
                          ToggleWeekStartEvent(isSundayStart: value)
                      );
                    },
                  ),
                ],
              ),

              Divider()
            ],
          ),
        ),
      );
    },
  );
}

Widget _dashboardScreenWidget(BuildContext context) {
  return BlocBuilder<GeneralSettingsBloc, GeneralSettingsState>(
    builder: (context, state) {
      bool isSundayStart = state.isSundayStart; // Replace with actual state property

      return Container(
        height: 500,
        width: 400,
        margin: const EdgeInsets.symmetric(vertical: 8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: kSeconderyColors,
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Bottom View Mode",
                    style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
                  ),
                  Switch(
                    value: isSundayStart,
                    onChanged: (value) {
                      // Add an event to the bloc to handle the switch
                      context.read<GeneralSettingsBloc>().add(
                          ToggleWeekStartEvent(isSundayStart: value)
                      );
                    },
                  ),
                ],
              ),
              Divider(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Show Category filter",
                    style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
                  ),
                  Switch(
                    value: isSundayStart,
                    onChanged: (value) {
                      // Add an event to the bloc to handle the switch
                      context.read<GeneralSettingsBloc>().add(
                          ToggleWeekStartEvent(isSundayStart: value)
                      );
                    },
                  ),
                ],
              ),
              Divider(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Show Streak Count",
                    style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
                  ),
                  Switch(
                    value: isSundayStart,
                    onChanged: (value) {
                      // Add an event to the bloc to handle the switch
                      context.read<GeneralSettingsBloc>().add(
                          ToggleWeekStartEvent(isSundayStart: value)
                      );
                    },
                  ),
                ],
              ),
              Divider(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Show Streak Goal",
                    style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
                  ),
                  Switch(
                    value: isSundayStart,
                    onChanged: (value) {
                      // Add an event to the bloc to handle the switch
                      context.read<GeneralSettingsBloc>().add(
                          ToggleWeekStartEvent(isSundayStart: value)
                      );
                    },
                  ),
                ],
              ),
              Divider(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Show Streak Labels",
                    style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
                  ),
                  Switch(
                    value: isSundayStart,
                    onChanged: (value) {
                      // Add an event to the bloc to handle the switch
                      context.read<GeneralSettingsBloc>().add(
                          ToggleWeekStartEvent(isSundayStart: value)
                      );
                    },
                  ),
                ],
              ),
              Divider(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Show Day Labels",
                    style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
                  ),
                  Switch(
                    value: isSundayStart,
                    onChanged: (value) {
                      // Add an event to the bloc to handle the switch
                      context.read<GeneralSettingsBloc>().add(
                          ToggleWeekStartEvent(isSundayStart: value)
                      );
                    },
                  ),
                ],
              ),
              Divider(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Show Categories",
                    style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
                  ),
                  Switch(
                    value: isSundayStart,
                    onChanged: (value) {
                      // Add an event to the bloc to handle the switch
                      context.read<GeneralSettingsBloc>().add(
                          ToggleWeekStartEvent(isSundayStart: value)
                      );
                    },
                  ),
                ],
              ),
              Divider()
            ],
          ),
        ),
      );
    },
  );
}