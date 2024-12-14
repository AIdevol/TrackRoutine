import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trackroutine/constants/colors.dart';
import 'package:trackroutine/features/screens/pages/habbit_adding_screen.dart';
import 'package:trackroutine/features/screens/pages/settings_screen.dart';
import 'package:trackroutine/utils/common_textField.dart';
import 'package:trackroutine/utils/size_utils.dart';

import '../../../config/iconly.dart';
import '../../daily_routine/presentation/homepage/home_screen_bloc.dart';
import '../../daily_routine/presentation/settings/setting_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return Scaffold(
      backgroundColor: CupertinoColors.white,
      appBar: AppBar(
        backgroundColor: CupertinoColors.white,
        title: const Text("TrackRoutine", style: TextStyle(
          fontSize: 25,
          fontWeight: FontWeight.bold,
        ),),
        leading: IconButton(
          onPressed: () => _showSettingsBottomSheet(context),
          icon: Icon(Icons.settings, color: kPrimarykColors, size: 25),
        ),
        actions: [
          IconButton(
              onPressed: ()=>_showAddingBottomSheet(context),
              icon: Icon(
                  Icons.add_circle_outline_rounded, color: kPrimarykColors,
                  size: 25)
          )
        ],
      ),
      body: Column(
        children: [
          BlocBuilder<HomeScreenBloc, HomeScreenState>(
            builder: (context, state) {
              if (state is HomeScreenLoading) {
                return Center(child: Container());
              } else if (state is HomeScreenLoaded) {
                return Center(
                  child: state.data,
                );
              } else if (state is HomeScreenError) {
                return Center(
                  child: Text(
                    state.errorMessage,
                    style: const TextStyle(fontSize: 18, color: Colors.red),
                  ),
                );
              }
              return const Center(child: Text("Welcome!"));
            },
          ),
        ],
      ),
    );
  }

  void _showSettingsBottomSheet(BuildContext context) {
    SizeConfig.init(context);
    showModalBottomSheet(
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(15))
      ),
      backgroundColor: CupertinoColors.white,
      context: context,
      builder: (BuildContext bottomSheetContext) {
        return BlocProvider(
          create: (context) => SettingBloc(),
          child: DraggableScrollableSheet(
            initialChildSize: 0.9,
            maxChildSize: 0.9,
            minChildSize: 0.3,
            expand: false,
            builder: (_, controller) =>
                Container(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      Row(
                        children: [
                          IconButton(onPressed:(){
                            Navigator.of(context).pop();
                          },icon: Icon(Icons.close,color: kPrimarykColors,size: 20,)),
                          SizedBox(width: 15,),
                          const Text(
                            "Settings",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      Expanded(child: SettingsScreen())
                    ],
                  ),
                ),
          ),
        );
      },
    );
  }

  void _showAddingBottomSheet(BuildContext context) {
    SizeConfig.init(context);
    showModalBottomSheet(
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(15))
      ),
      backgroundColor: CupertinoColors.white,
      context: context,
      builder: (BuildContext bottomSheetContext) {
        return BlocProvider(
          create: (context) => SettingBloc(),
          child: DraggableScrollableSheet(
            initialChildSize: 0.9,
            maxChildSize: 0.9,
            minChildSize: 0.3,
            expand: false,
            builder: (_, controller) =>
                Container(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      Row(
                        children: [
                          IconButton(onPressed:(){
                            Navigator.of(context).pop();
                          },icon: Icon(Icons.close,color: kPrimarykColors,size: 20,)),
                          SizedBox(width: 15,),
                          const Text(
                            "Add Your Routine",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      Expanded(child: HabbitAddingScreen())
                    ],
                  ),
                ),
          ),
        );
      },
    );
  }
}