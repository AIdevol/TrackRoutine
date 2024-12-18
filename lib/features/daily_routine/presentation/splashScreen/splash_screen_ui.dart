// splash_screen_page.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:trackroutine/constants/image.dart';
import 'package:trackroutine/constants/string_routes.dart';
import 'splash_screen_bloc.dart';

class SplashScreenPage extends StatelessWidget {
  const SplashScreenPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SplashScreenBloc()..add(InitializeSplashEvent()),
      child: BlocListener<SplashScreenBloc, SplashScreenState>(
        listener: (context, state) {
          if (state is SplashScreenAuthenticated) {
            // Navigate to home screen
            Navigator.of(context).pushReplacementNamed(AppRoutes.homeScreen);
          } else if (state is SplashScreenUnauthenticated) {
            // Navigate to login screen
            Navigator.of(context).pushReplacementNamed(AppRoutes.loginScreen);
            // Navigator.of(context).pushReplacementNamed(AppRoutes.homeScreen);
          } else if (state is SplashScreenError) {
            // Show error dialog
            _showErrorDialog(context, state.errorMessage);
          }
        },
        child: Scaffold(
          body: Center(
            child: BlocBuilder<SplashScreenBloc, SplashScreenState>(
              builder: (context, state) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Your app logo or loading indicator
                    Center(
                      child: Container(
                        height: 120,
                          width: 120,
                          decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
                          child: Image.asset(appIcon,fit: BoxFit.cover,)),
                    ),
                    const SizedBox(height: 20),
                    Text(
                      'Loading...',
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    const SizedBox(height: 20),
                    const CircularProgressIndicator(),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }

  void _showErrorDialog(BuildContext context, String errorMessage) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Initialization Error'),
        content: Text(errorMessage),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
              // Optionally retry initialization or navigate to an error screen
            },
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }
}