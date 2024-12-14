import 'package:flutter/cupertino.dart';
import 'package:trackroutine/constants/string_routes.dart';
import 'package:trackroutine/features/screens/pages/archive_habits_settings.dart';
import 'package:trackroutine/features/screens/pages/general_view_screen.dart';
import 'package:trackroutine/features/screens/pages/themes_view_screen.dart';

import '../features/screens/pages/home_screen.dart';

final Map<String,WidgetBuilder> route={
  // AppRoutes.splashScreen:
  AppRoutes.homeScreen:(context)=>const HomeScreen(),
  AppRoutes.generalViewScreen:(context)=>const GeneralViewScreen(),
  AppRoutes.themesViewScreen:(context)=> const ThemesViewScreen(),
  AppRoutes.archivedViewScreen:(context)=>const ArchivedHabits()
};
