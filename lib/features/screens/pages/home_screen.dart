import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_heatmap_calendar/flutter_heatmap_calendar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:trackroutine/constants/colors.dart';
import 'package:trackroutine/constants/string_routes.dart';
import 'package:trackroutine/features/screens/pages/habbit_adding_screen.dart';
import 'package:trackroutine/features/screens/pages/settings_screen.dart';
import 'package:trackroutine/utils/common_textField.dart';
import 'package:trackroutine/utils/extra_utils.dart';
import 'package:trackroutine/utils/size_utils.dart';

import '../../../config/iconly.dart';
import '../../daily_routine/presentation/homepage/home_screen_bloc.dart';
import '../../daily_routine/presentation/settings/setting_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery
        .of(context)
        .size
        .width;
    final screenHeight = MediaQuery
        .of(context)
        .size
        .height;

    return MyAnnotatedRegion(
      overlayStyle: SystemUiOverlayStyle.light.copyWith(
        statusBarColor: CupertinoColors.white,
        statusBarIconBrightness: Brightness.light,
      ),
      child: BlocProvider(
        create: (context) => HomeScreenBloc(),
        child: BlocBuilder<HomeScreenBloc, HomeScreenState>(
          builder: (context, state) =>
              Scaffold(
                backgroundColor: Colors.white,
                body: SafeArea(
                  child: Stack(
                    children: [
                      // Title Bar
                      Positioned(
                        top: screenHeight * 0.03,
                        left: screenWidth * 0.05,
                        right: screenWidth * 0.05,
                        child: _titleBarViewScreen(
                            context, screenWidth, screenHeight),
                      ),
                      Positioned(
                        top: screenHeight * 0.18,
                        left: screenWidth * 0.05,
                        right: screenWidth * 0.05,
                        child:   _totalViewsForData(context,screenWidth, screenHeight),),
                  Positioned(
                    top: screenHeight * 0.3,
                    left: screenWidth * 0.05,
                    right: screenWidth * 0.05,
                    child:   _mangeHeatMapWidget(context,screenWidth, screenHeight),),

                      // Bottom Navigation
                      Positioned(
                        bottom: screenHeight * 0.03,
                        left: screenWidth * 0.05,
                        right: screenWidth * 0.05,
                        child: _bottomViewScreen(
                            context, screenWidth, screenHeight),
                      ),
                    ],
                  ),
                ),
              ),
        ),
      ),
    );
  }

  Widget _titleBarViewScreen(BuildContext context, double screenWidth,
      double screenHeight) {
    return Container(
      height: screenHeight * 0.10,
      width: screenWidth * 0.9,
      decoration: BoxDecoration(
        color: CupertinoColors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            blurRadius: 10,
            spreadRadius: 2,
            offset: Offset(0, 5),
          ),
        ],
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.04),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "TrackRoutine",
              style: TextStyle(
                  fontSize: screenWidth * 0.06,
                  fontWeight: FontWeight.bold,
                  color: kPrimarykColors
              ),
            ),
            CircleAvatar(
              backgroundImage: NetworkImage(
                  'https://images.ctfassets.net/h6goo9gw1hh6/2sNZtFAWOdP1lmQ33VwRN3/24e953b920a9cd0ff2e1d587742a2472/1-intro-photo-final.jpg?w=1200&h=992&q=70&fm=webp'),
              radius: screenWidth * 0.08,
            )
          ],
        ),
      ),
    );
  }

  Widget _bottomViewScreen(BuildContext context, double screenWidth,
      double screenHeight) {
    return Container(
      height: screenHeight * 0.10,
      width: screenWidth * 0.9,
      decoration: BoxDecoration(
        color: CupertinoColors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            blurRadius: 10,
            spreadRadius: 2,
            offset: Offset(0, 5),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 12.0, right: 12.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              onPressed: () => _showSettingsBottomSheet(context),
              icon: Icon(
                Icons.settings,
                color: kPrimarykColors,
                size: screenWidth * 0.1,
              ),
            ),
            IconButton(
              onPressed: () => _showAddingBottomSheet(context),
              icon: Icon(
                Icons.add_circle_outline_rounded,
                color: kPrimarykColors,
                size: screenWidth * 0.1,
              ),
            ),
            IconButton(
              onPressed: () => _showProfileBottomSheet(context),
              icon: Icon(
                Icons.menu_rounded,
                color: kPrimarykColors,
                size: screenWidth * 0.1,
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showSettingsBottomSheet(BuildContext context) {
    SizeConfig.init(context);
    final screenHeight = MediaQuery
        .of(context)
        .size
        .height;

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
                          IconButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            icon: Icon(
                                Icons.close, color: kPrimarykColors, size: 20),
                          ),
                          SizedBox(width: 15),
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
                          IconButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            icon: Icon(
                                Icons.close, color: kPrimarykColors, size: 20),
                          ),
                          SizedBox(width: 15),
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

  void _showProfileBottomSheet(BuildContext context) {
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
            initialChildSize: 0.25,
            maxChildSize: 0.25,
            minChildSize: 0.2,
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
                          IconButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            icon: Icon(
                                Icons.close, color: kPrimarykColors, size: 20),
                          ),
                        ],
                      ),
                      SizedBox(height: 20),
                      _containerWidget(context),
                      SizedBox(height: 10),
                      _logOutWidget(context)
                    ],
                  ),
                ),
          ),
        );
      },
    );
  }


  Widget _containerWidget(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return InkWell(
      onTap: () {
        Navigator.of(context).pushNamed(AppRoutes.profileManageViewScreen);
      },
      child: Container(
        width: screenWidth * 0.9, // 90% of screen width
        padding: EdgeInsets.symmetric(vertical: 12),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Manage Profile",
              style: TextStyle(
                  fontSize: screenWidth * 0.045, // Responsive font size
                  fontWeight: FontWeight.bold,
                  color: kPrimarykColors
              ),
            ),
            Icon(
              Icons.arrow_forward_ios,
              color: kPrimarykColors,
              size: screenWidth * 0.06, // Responsive icon size
            )
          ],
        ),
      ),
    );
  }

  Widget _logOutWidget(BuildContext context) {
    final screenWidth = MediaQuery
        .of(context)
        .size
        .width;

    return InkWell(
      onTap: () {
        // Logout implementation
      },
      child: Container(
        width: screenWidth * 0.9, // 90% of screen width
        padding: EdgeInsets.symmetric(vertical: 12),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "LogOut",
              style: TextStyle(
                  fontSize: screenWidth * 0.045, // Responsive font size
                  fontWeight: FontWeight.bold,
                  color: kPrimarykColors
              ),
            ),
            Icon(
              Icons.logout,
              color: kPrimarykColors,
              size: screenWidth * 0.06, // Responsive icon size
            )
          ],
        ),
      ),
    );
  }
}

Widget _mangeHeatMapWidget(BuildContext context, double screenWidth, double screenHeight) {
  return Material(
    elevation: 2,
    borderRadius: BorderRadius.circular(10),
    child: Container(
      height: screenHeight * 0.5,
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            blurRadius: 10,
            spreadRadius: 2,
            offset: Offset(0, 5),
          ),
        ],
      ),
      child: _buildHeatMap(),
    ),
  );
}

Widget _buildHeatMap() {
  Map<DateTime, int> heatMapDataset = {
    DateTime(2024, 1, 1): 5,
    DateTime(2024, 1, 2): 10,
    DateTime(2024, 1, 3): 15,
    DateTime(2024, 1, 4): 20,
    DateTime(2024, 1, 5): 25,
    DateTime(2024, 1, 6): 30,
    DateTime(2024, 1, 7): 35,
  };

  return HeatMapCalendar(
    datasets: heatMapDataset,
    colorMode: ColorMode.color,
    defaultColor: Colors.grey.shade200,
    textColor: Colors.black,
    colorsets: {
      1: Colors.green.shade100,
      5: Colors.green.shade300,
      10: Colors.green.shade500,
      20: Colors.green.shade700,
      30: Colors.green.shade900,
    },
    // weekDayLabels: ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'],
    // monthYearLabel: 'January 2024',
    // selectedDateColor: Colors.red,
    // onTapDate: (date, value) {
    //   // Optional: Handle date tap
    //   print('Tapped date: $date, value: $value');
    // },
  );
}
Widget _totalViewsForData(BuildContext context, double screenWidth, double screenHeight){
  return Material(
    elevation: 2,
    borderRadius: BorderRadius.circular(10),
    child: Container(
      height: screenHeight*0.1,
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            blurRadius: 10,
            spreadRadius: 2,
            offset: Offset(0, 5),
          ),
        ],
      ),
            child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildProgressItem('Total Habits', '12', Colors.blue),
          _buildProgressItem('Completed', '8', Colors.green),
          _buildProgressItem('Pending', '4', Colors.orange),
        ],
      ),
    ),
  );
}
  Widget _buildProgressItem(String title, String value, Color color) {
    return Column(
      children: [
        Text(
          value,
          style: GoogleFonts.poppins(
            fontSize: 24,
            fontWeight: FontWeight.w700,
            color: color,
          ),
        ),
        Text(
          title,
          style: GoogleFonts.poppins(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: Colors.grey.shade600,
          ),
        ),
      ],
    );
  }
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_heatmap_calendar/flutter_heatmap_calendar.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:trackroutine/constants/colors.dart';
// import 'package:trackroutine/features/screens/pages/habbit_adding_screen.dart';
// import 'package:trackroutine/features/screens/pages/settings_screen.dart';
//
// class ImprovedHomeScreen extends StatelessWidget {
//   const ImprovedHomeScreen({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return AnnotatedRegion<SystemUiOverlayStyle>(
//       value: SystemUiOverlayStyle.dark.copyWith(
//         statusBarColor: Colors.transparent,
//         systemNavigationBarColor: Colors.white,
//       ),
//       child: Scaffold(
//         backgroundColor: const Color(0xFFF5F5F5),
//         body: SafeArea(
//           child: SingleChildScrollView(
//             physics: const BouncingScrollPhysics(),
//             child: Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   _buildTopBar(context),
//                   const SizedBox(height: 20),
//                   _buildWelcomeSection(),
//                   const SizedBox(height: 20),
//                   _buildProgressOverview(),
//                   const SizedBox(height: 20),
//                   _buildHabitHeatmap(),
//                   const SizedBox(height: 20),
//                   _buildQuickActions(context),
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
//
//   Widget _buildTopBar(BuildContext context) {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//       children: [
//         Text(
//           'TrackRoutine',
//           style: GoogleFonts.poppins(
//             fontSize: 24,
//             fontWeight: FontWeight.w700,
//             color: Colors.deepPurple,
//           ),
//         ),
//         GestureDetector(
//           onTap: () => _showProfileOptions(context),
//           child: Container(
//             decoration: BoxDecoration(
//               shape: BoxShape.circle,
//               border: Border.all(color: Colors.deepPurple.shade100, width: 2),
//             ),
//             child: CircleAvatar(
//               radius: 25,
//               backgroundImage: const NetworkImage(
//                 'https://images.unsplash.com/photo-1506794778202-cad84cf45f1d?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80',
//               ),
//             ),
//           ),
//         ),
//       ],
//     );
//   }
//
//   Widget _buildWelcomeSection() {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Text(
//           'Good Morning,',
//           style: GoogleFonts.poppins(
//             fontSize: 18,
//             fontWeight: FontWeight.w500,
//             color: Colors.grey.shade600,
//           ),
//         ),
//         Text(
//           'John Doe',
//           style: GoogleFonts.poppins(
//             fontSize: 28,
//             fontWeight: FontWeight.w700,
//             color: Colors.deepPurple,
//           ),
//         ),
//       ],
//     );
//   }
//
//   Widget _buildProgressOverview() {
//     return Container(
//       padding: const EdgeInsets.all(15),
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(15),
//         boxShadow: [
//           BoxShadow(
//             color: Colors.deepPurple.shade100.withOpacity(0.3),
//             blurRadius: 10,
//             offset: const Offset(0, 5),
//           ),
//         ],
//       ),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceAround,
//         children: [
//           _buildProgressItem('Total Habits', '12', Colors.blue),
//           _buildProgressItem('Completed', '8', Colors.green),
//           _buildProgressItem('Pending', '4', Colors.orange),
//         ],
//       ),
//     );
//   }
//
//   Widget _buildProgressItem(String title, String value, Color color) {
//     return Column(
//       children: [
//         Text(
//           value,
//           style: GoogleFonts.poppins(
//             fontSize: 24,
//             fontWeight: FontWeight.w700,
//             color: color,
//           ),
//         ),
//         Text(
//           title,
//           style: GoogleFonts.poppins(
//             fontSize: 14,
//             fontWeight: FontWeight.w500,
//             color: Colors.grey.shade600,
//           ),
//         ),
//       ],
//     );
//   }
//
//   Widget _buildHabitHeatmap() {
//     Map<DateTime, int> heatMapDataset = {
//       DateTime(2024, 1, 1): 5,
//       DateTime(2024, 1, 2): 10,
//       DateTime(2024, 1, 3): 15,
//       DateTime(2024, 1, 4): 20,
//       DateTime(2024, 1, 5): 25,
//       DateTime(2024, 1, 6): 30,
//       DateTime(2024, 1, 7): 35,
//     };
//
//     return Container(
//       padding: const EdgeInsets.all(15),
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(15),
//         boxShadow: [
//           BoxShadow(
//             color: Colors.deepPurple.shade100.withOpacity(0.3),
//             blurRadius: 10,
//             offset: const Offset(0, 5),
//           ),
//         ],
//       ),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Text(
//             'Habit Progress',
//             style: GoogleFonts.poppins(
//               fontSize: 18,
//               fontWeight: FontWeight.w600,
//               color: Colors.deepPurple,
//             ),
//           ),
//           const SizedBox(height: 10),
//           HeatMapCalendar(
//             datasets: heatMapDataset,
//             colorMode: ColorMode.color,
//             defaultColor: Colors.grey.shade200,
//             textColor: Colors.black,
//             colorsets: {
//               1: Colors.green.shade100,
//               5: Colors.green.shade300,
//               10: Colors.green.shade500,
//               20: Colors.green.shade700,
//               30: Colors.green.shade900,
//             },
//           ),
//         ],
//       ),
//     );
//   }
//
//   Widget _buildQuickActions(BuildContext context) {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//       children: [
//         _buildActionButton(
//           icon: Icons.add,
//           label: 'Add Habit',
//           color: Colors.blue,
//           onTap: () => _showAddHabitSheet(context),
//         ),
//         _buildActionButton(
//           icon: Icons.settings,
//           label: 'Settings',
//           color: Colors.deepPurple,
//           onTap: () => _showSettingsSheet(context),
//         ),
//         _buildActionButton(
//           icon: Icons.analytics_outlined,
//           label: 'Analytics',
//           color: Colors.green,
//           onTap: () {/* Navigate to analytics */},
//         ),
//       ],
//     );
//   }
//
//   Widget _buildActionButton({
//     required IconData icon,
//     required String label,
//     required Color color,
//     required VoidCallback onTap,
//   }) {
//     return GestureDetector(
//       onTap: onTap,
//       child: Container(
//         padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
//         decoration: BoxDecoration(
//           color: color.withOpacity(0.1),
//           borderRadius: BorderRadius.circular(10),
//         ),
//         child: Column(
//           children: [
//             Icon(icon, color: color, size: 30),
//             const SizedBox(height: 5),
//             Text(
//               label,
//               style: GoogleFonts.poppins(
//                 color: color,
//                 fontWeight: FontWeight.w500,
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
//
//   void _showAddHabitSheet(BuildContext context) {
//     showModalBottomSheet(
//       context: context,
//       isScrollControlled: true,
//       shape: const RoundedRectangleBorder(
//         borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
//       ),
//       builder: (context) => DraggableScrollableSheet(
//         initialChildSize: 0.9,
//         maxChildSize: 0.9,
//         minChildSize: 0.5,
//         expand: false,
//         builder: (_, controller) => HabbitAddingScreen(),
//       ),
//     );
//   }
//
//   void _showSettingsSheet(BuildContext context) {
//     showModalBottomSheet(
//       context: context,
//       isScrollControlled: true,
//       shape: const RoundedRectangleBorder(
//         borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
//       ),
//       builder: (context) => DraggableScrollableSheet(
//         initialChildSize: 0.9,
//         maxChildSize: 0.9,
//         minChildSize: 0.5,
//         expand: false,
//         builder: (_, controller) => SettingsScreen(),
//       ),
//     );
//   }
//
//   void _showProfileOptions(BuildContext context) {
//     showModalBottomSheet(
//       context: context,
//       shape: const RoundedRectangleBorder(
//         borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
//       ),
//       builder: (context) => Container(
//         padding: const EdgeInsets.all(20),
//         child: Column(
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             ListTile(
//               leading: const Icon(Icons.person, color: Colors.deepPurple),
//               title: Text(
//                 'Profile',
//                 style: GoogleFonts.poppins(),
//               ),
//               onTap: () {/* Navigate to profile */},
//             ),
//             ListTile(
//               leading: const Icon(Icons.logout, color: Colors.red),
//               title: Text(
//                 'Logout',
//                 style: GoogleFonts.poppins(color: Colors.red),
//               ),
//               onTap: () {/* Implement logout */},
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }