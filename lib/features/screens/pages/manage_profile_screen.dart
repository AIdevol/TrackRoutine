import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trackroutine/constants/colors.dart';
import 'package:trackroutine/constants/image.dart';
import 'package:trackroutine/utils/extra_utils.dart';

import '../../../constants/enum.dart';
import '../../daily_routine/presentation/profile_manage/manage_profile_screen_bloc.dart';

class ManageProfileScreen extends StatelessWidget {
  const ManageProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MyAnnotatedRegion(
      overlayStyle: SystemUiOverlayStyle.light.copyWith(
        statusBarColor: kPrimarykColors.withOpacity(0.2),
        statusBarIconBrightness: Brightness.light,
      ),
      child: BlocProvider(
        create: (context) => ManageProfileScreenBloc(),
        child: BlocConsumer<ManageProfileScreenBloc, ManageProfileScreenState>(
          listener: (context, state) {
            // TODO: Add state change listeners if needed
            if (state.status == ProfileStatus.success) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Profile Updated Successfully')),
              );
            } else if (state.status == ProfileStatus.failure) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Profile Update Failed'),
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
                      child: Stack(
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              // Profile Title
                              Text(
                                'Manage Profile',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 24),
                          
                              // Profile Picture
                              Center(
                                child: Stack(
                                  children: [
                                    CircleAvatar(
                                      radius: 80,
                                      backgroundColor: Colors.white.withOpacity(0.2),
                                      backgroundImage: state?.profilePicture != null
                                          ? FileImage(state.profilePicture!)
                                          : null,
                                      child: state.profilePicture == null
                                          ? Icon(Icons.person, size: 80, color: Colors.white)
                                          : null,
                                    ),
                                    Positioned(
                                      bottom: 0,
                                      right: 0,
                                      child: Container(
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          shape: BoxShape.circle,
                                        ),
                                        child: IconButton(
                                          icon: Icon(Icons.camera_alt, color: kPrimarykColors),
                                          onPressed: () {
                                            // context.read<ManageProfileScreenBloc>().add(
                                            //     PickProfilePictureEvent()
                                            // );
                                          },
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(height: 24),
                          
                              // Full Name Input
                              _buildTextField(
                                context,
                                hintText: 'Full Name',
                                prefixIcon: Icons.person_outline,
                                obscureText: false,
                                primaryColor: kPrimarykColors,
                                initialValue: state.fullName,
                                onChanged: (value) {
                                  context.read<ManageProfileScreenBloc>().add(
                                      FullNameChangedEvent(fullName: value)
                                  );
                                },
                              ),
                              const SizedBox(height: 16),
                          
                              // Email Input (potentially disabled)
                              _buildTextField(
                                context,
                                hintText: 'Email',
                                prefixIcon: Icons.email_outlined,
                                obscureText: false,
                                primaryColor: kPrimarykColors,
                                initialValue: state.email,
                                enabled: false, // Typically email is not changed
                                onChanged: (value) {},
                              ),
                              const SizedBox(height: 16),
                              _buildTextField(
                                context,
                                hintText: 'Phone',
                                prefixIcon: Icons.phone_android_sharp,
                                obscureText: false,
                                primaryColor: kPrimarykColors,
                                initialValue: state.email,
                                enabled: false, // Typically email is not changed
                                onChanged: (value) {},
                              ),
                              const SizedBox(height: 16,),
                              _buildTextField(
                                context,
                                hintText: 'Address',
                                prefixIcon: Icons.location_on_rounded,
                                obscureText: false,
                                primaryColor: kPrimarykColors,
                                initialValue: state.email,
                                enabled: false, // Typically email is not changed
                                onChanged: (value) {},
                              ),
                              const SizedBox(height: 16,),
                          
                              // Update Button
                              ElevatedButton(
                                onPressed: state.status == ProfileStatus.loading
                                    ? null
                                    : () {
                                  context.read<ManageProfileScreenBloc>().add(
                                      UpdateProfileEvent()
                                  );
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.white,
                                  padding: const EdgeInsets.symmetric(vertical: 16),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                ),
                                child: state.status == ProfileStatus.loading
                                    ? CircularProgressIndicator(color: kPrimarykColors)
                                    : Text(
                                  'Update Profile',
                                  style: TextStyle(
                                    color: kPrimarykColors,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                          
                              const SizedBox(height: 24),
                            ],
                          ),
                          Positioned(
                            top: 0,
                              child: IconButton( onPressed: (){
                                Navigator.of(context).pop();
                              },icon: Icon(Icons.arrow_back_ios,size: 30,color: kPrimarykColors,)))
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

  // TextField Widget (similar to register screen)
  Widget _buildTextField(
      BuildContext context, {
        required String hintText,
         IconData? prefixIcon,
        required bool obscureText,
        required Color primaryColor,
        String? initialValue,
        bool enabled = true,
        required Function(String) onChanged,
      }) {
    return TextField(
      controller: initialValue != null ? TextEditingController(text: initialValue) : null,
      onChanged: onChanged,
      obscureText: obscureText,
      enabled: enabled,
      style: TextStyle(
          color: enabled ? Colors.white : Colors.white.withOpacity(0.5)
      ),
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: TextStyle(color: Colors.white.withOpacity(0.7)),
        prefixIcon: Icon(prefixIcon, color: enabled ? Colors.white : Colors.white.withOpacity(0.5)),
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
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}