import 'package:flutter/material.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trackroutine/constants/colors.dart';
import 'package:trackroutine/constants/image.dart';
import 'package:trackroutine/utils/extra_utils.dart';

import '../../../constants/enum.dart';
import '../signUp/register_screen_bloc.dart';

class RegisterViewScreen extends StatelessWidget {
  const RegisterViewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Custom color from D4AF37 hex (matching login screen)

    return MyAnnotatedRegion(
      overlayStyle: SystemUiOverlayStyle.light.copyWith(
        statusBarColor:kPrimarykColors.withOpacity(0.2),
        statusBarIconBrightness: Brightness.light,
      ),
      child: BlocProvider(
        create: (context) => RegisterScreenBloc(),
        child: BlocConsumer<RegisterScreenBloc, RegisterScreenState>(
          listener: (context, state) {
            if (state.status == RegisterStatus.success) {
              // TODO: Navigate to login screen or home screen
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Registration Successful')),
              );
            } else if (state.status == RegisterStatus.failure) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Registration Failed'),
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

                          // Full Name Input
                          _buildTextField(
                            context,
                            hintText: 'Full Name',
                            prefixIcon: Icons.person_outline,
                            obscureText: false,
                            primaryColor: kPrimarykColors,
                            onChanged: (value) {
                              context.read<RegisterScreenBloc>().add(
                                  FullNameChangedEvent(fullName: value)
                              );
                            },
                          ),
                          const SizedBox(height: 16),

                          // Email Input
                          _buildTextField(
                            context,
                            hintText: 'Email',
                            prefixIcon: Icons.email_outlined,
                            obscureText: false,
                            primaryColor: kPrimarykColors,
                            onChanged: (value) {
                              context.read<RegisterScreenBloc>().add(
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
                              context.read<RegisterScreenBloc>().add(
                                  PasswordChangedEvent(password: value)
                              );
                            },
                          ),
                          const SizedBox(height: 16),

                          // Confirm Password Input
                          _buildTextField(
                            context,
                            hintText: 'Confirm Password',
                            prefixIcon: Icons.lock_outline,
                            obscureText: true,
                            primaryColor: kPrimarykColors,
                            onChanged: (value) {
                              context.read<RegisterScreenBloc>().add(
                                  ConfirmPasswordChangedEvent(confirmPassword: value)
                              );
                            },
                          ),

                          const SizedBox(height: 24),

                          // Register Button
                          ElevatedButton(
                            onPressed: state.status == RegisterStatus.loading
                                ? null
                                : () {
                              context.read<RegisterScreenBloc>().add(
                                  RegisterSubmittedEvent()
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.white,
                              padding: const EdgeInsets.symmetric(vertical: 16),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                            child: state.status == RegisterStatus.loading
                                ? CircularProgressIndicator(color: kPrimarykColors)
                                : Text(
                              'Register',
                              style: TextStyle(
                                color: kPrimarykColors,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),

                          const SizedBox(height: 24),

                          // Login Row
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Already have an account? ',
                                style: TextStyle(
                                  color: Colors.white.withOpacity(0.8),
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  // TODO: Navigate to Login Screen
                                },
                                child: Text(
                                  'Log In',
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

  // TextField Widget (identical to login screen)
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