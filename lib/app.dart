import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'constants/routes.dart';
import 'features/daily_routine/presentation/homepage/home_screen_bloc.dart';
import 'features/daily_routine/presentation/splashScreen/splash_screen_ui.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: BlocProvider(
        create: (context) => HomeScreenBloc()..add(LoadHomeData()), // Trigger event
        child: const SplashScreenPage(),
      ),
      // initialRoute: AppRoutes.homeScreen,
      routes: route,
    );
  }
}