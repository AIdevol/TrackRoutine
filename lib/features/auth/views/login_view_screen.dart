import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trackroutine/constants/image.dart';
import 'package:trackroutine/constants/string_routes.dart';
import 'package:trackroutine/features/auth/login/login_screen_bloc.dart';
import 'package:trackroutine/utils/extra_utils.dart';

import '../../../constants/colors.dart';
import '../../../constants/enum.dart';

class LoginViewScreen extends StatelessWidget {
  const LoginViewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Custom color from D4AF37 hex

    return MyAnnotatedRegion(
      overlayStyle: SystemUiOverlayStyle.light.copyWith(
        statusBarColor:kPrimarykColors.withOpacity(0.2),
        statusBarIconBrightness: Brightness.light,
      ),
      child: BlocProvider(
        create: (context) => LoginScreenBloc(),
        child: BlocConsumer<LoginScreenBloc, LoginScreenState>(
          listener: (context, state) {
            if (state.status == LoginStatus.success) {
              // TODO: Navigate to home screen or next page
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Login Successful')),
              );
            } else if (state.status == LoginStatus.failure) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Login Failed'),
                  backgroundColor: Colors.red,
                ),
              );
            }
          },
          builder: (context, state) {
            return Scaffold(
              extendBodyBehindAppBar: true,
              body: SafeArea(
                child: SingleChildScrollView(
                  child: Container(
                    height: MediaQuery.of(context).size.height,
                    decoration: BoxDecoration(
                      gradient: linearGradientBackGround
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          // App Logo
                          Hero(
                            tag: 'app_logo',
                            child: Image.asset(
                              appIcon,
                              height: 120,
                              width: 120,
                            ),
                          ),
                          const SizedBox(height: 40),

                          // Email Input
                          _buildTextField(
                            context,
                            hintText: 'Email',
                            prefixIcon: Icons.email_outlined,
                            obscureText: false,
                            primaryColor: kPrimarykColors,
                            onChanged: (value) {
                              context.read<LoginScreenBloc>().add(
                                  EmailChangedEvent(email: value)
                              );
                            },
                          ),
                          const SizedBox(height: 16),

                          // Password Input
                          _buildTextField(
                            context,
                            hintText: 'Password',
                            prefixIcon: Icons.lock_outline,
                            obscureText: true,
                            primaryColor: kPrimarykColors,
                            onChanged: (value) {
                              context.read<LoginScreenBloc>().add(
                                  PasswordChangedEvent(password: value)
                              );
                            },
                          ),

                          // Forgot Password
                          Align(
                            alignment: Alignment.centerRight,
                            child: TextButton(
                              onPressed: () {
                                // TODO: Implement forgot password navigation
                              },
                              child: Text(
                                'Forgot Password?',
                                style: TextStyle(
                                  color: Colors.white.withOpacity(0.8),
                                ),
                              ),
                            ),
                          ),

                          const SizedBox(height: 24),

                          // Login Button
                          ElevatedButton(
                            onPressed: state.status == LoginStatus.loading
                                ? null
                                : () {
                              Navigator.of(context).pushNamed(AppRoutes.homeScreen);
                              // context.read<LoginScreenBloc>().add(
                              //     LoginSubmittedEvent()
                              // );
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.white,
                              padding: const EdgeInsets.symmetric(vertical: 16),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                            child: state.status == LoginStatus.loading
                                ? CircularProgressIndicator(color: kPrimarykColors)
                                : Text(
                              'Login',
                              style: TextStyle(
                                color: kPrimarykColors,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),

                          const SizedBox(height: 24),

                          // Sign Up Row
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Don\'t have an account? ',
                                style: TextStyle(
                                  color: Colors.white.withOpacity(0.8),
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  Navigator.of(context).pushNamed(AppRoutes.registerScreen);
                                },
                                child: Text(
                                  'Sign Up',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  // Updated TextField Widget with primary color parameter
  Widget _buildTextField(
      BuildContext context, {
        required String hintText,
        required IconData prefixIcon,
        required bool obscureText,
        required Color primaryColor,
        required Function(String) onChanged,
      }) {
    return TextField(
      onChanged: onChanged,
      obscureText: obscureText,
      style: const TextStyle(color: Colors.white),
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: TextStyle(color: Colors.white.withOpacity(0.7)),
        prefixIcon: Icon(prefixIcon, color: Colors.white),
        filled: true,
        fillColor: Colors.white.withOpacity(0.2),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: primaryColor, width: 2),
        ),
      ),
    );
  }
}