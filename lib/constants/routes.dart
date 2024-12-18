import 'package:flutter/cupertino.dart';
import 'package:trackroutine/constants/string_routes.dart';
import 'package:trackroutine/features/auth/views/login_view_screen.dart';
import 'package:trackroutine/features/auth/views/register_view_screen.dart';
import 'package:trackroutine/features/screens/pages/archive_habits_settings.dart';
import 'package:trackroutine/features/screens/pages/general_view_screen.dart';
import 'package:trackroutine/features/screens/pages/manage_profile_screen.dart';
import 'package:trackroutine/features/screens/pages/themes_view_screen.dart';

import '../features/daily_routine/presentation/splashScreen/splash_screen_ui.dart';
import '../features/screens/pages/home_screen.dart';

final Map<String,WidgetBuilder> route={
  AppRoutes.splashScreen:(context)=>const SplashScreenPage(),
  AppRoutes.homeScreen:(context)=>const HomeScreen(),
  AppRoutes.generalViewScreen:(context)=>const GeneralViewScreen(),
  AppRoutes.themesViewScreen:(context)=> const ThemesViewScreen(),
  AppRoutes.archivedViewScreen:(context)=>const ArchivedHabits(),
  AppRoutes.loginScreen:(context)=>const LoginViewScreen(),
  AppRoutes.registerScreen:(context)=>const RegisterViewScreen(),
  AppRoutes.profileManageViewScreen:(context)=>ManageProfileScreen(),
};
