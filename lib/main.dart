import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logger/logger.dart';
import 'package:trackroutine/constants/routes.dart';
import 'package:trackroutine/constants/string_routes.dart';
import 'package:trackroutine/features/screens/pages/home_screen.dart';

import 'features/daily_routine/presentation/homepage/home_screen_bloc.dart';

var logger = Logger();

void main() {
  runApp(
      const MyApp());
}

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//
//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return BlocBuilder<HomeScreenBloc, HomeScreenState>(
//       builder: (context, state) {
//         return MaterialApp(
//           debugShowCheckedModeBanner: false,
//           title: 'Flutter Demo',
//           theme: ThemeData(
//             colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
//             useMaterial3: true,
//           ),
//           home: HomeScreenBloc(),
//         );
//       },
//     );
//   }
// }
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
        child: const HomeScreen(),
      ),
      // initialRoute: AppRoutes.homeScreen,
      routes: route,
    );
  }
}
