import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trackroutine/features/daily_routine/settings/themes/theme_settings_bloc.dart';

import '../../../constants/colors.dart';

class ThemesViewScreen extends StatelessWidget {
  const ThemesViewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context)=>ThemeSettingsBloc(),
    child: BlocBuilder<ThemeSettingsBloc, ThemeSettingsState>(builder: (context,state)=>
    Scaffold(
      appBar: AppBar(
        leading: InkWell(
          onTap: () => Navigator.of(context).pop(),
          child: Icon(
            Icons.arrow_back_ios,
            color: kPrimarykColors,
          ),
        ),
        title:Text('Theme',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: _themesScreenWidget(context),
      ),
    )
    ),);
  }
}

Widget _themesScreenWidget(BuildContext context) {
  return BlocBuilder<ThemeSettingsBloc, ThemeSettingsState>(
    builder: (context, state) {

      return Padding(
        padding: const EdgeInsets.all(10.0),
        child: Container(
          height: 180,
          width: 400,
          margin: const EdgeInsets.symmetric(vertical: 8),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: kSeconderyColors,
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 10,),
                GestureDetector(
                  onTap: (){},
                  child: const Text("System",style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500),),
                ),
                Divider(),
                GestureDetector(
                  onTap: (){},
                  child: const Text("Light",style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500),),
                ),
                Divider(),
                GestureDetector(
                  onTap: (){},
                  child: const Text("Dark",style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500),),
                ),
                Divider()
              ],
            ),
          ),
        ),
      );
    },
  );
}