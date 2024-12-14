import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trackroutine/constants/colors.dart';
import 'package:trackroutine/constants/string_routes.dart';
import 'package:trackroutine/features/daily_routine/presentation/settings/setting_bloc.dart';
import 'package:trackroutine/utils/size_utils.dart';

class SettingsScreen extends StatelessWidget{
  SettingsScreen({super.key});


  @override
  Widget build(BuildContext context){
    return BlocProvider(
  create: (context) => SettingBloc(),
  child: BlocBuilder<SettingBloc, SettingState>(builder: (BuildContext context, SettingState state) {
     return Column(
       children: [
         SizedBox(height: 20,),
       _buildContainerForSettings(context),
         SizedBox(height: 20,),
         _buildContainerForBasics(context)
       ],);
    },),
);
  }

}

Widget _buildContainerForSettings(BuildContext context){
  return Container(
    height: 300,
    width: 400,
    decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),color: kSeconderyColors,),
    child: Column(children: [
      SizedBox(height: 20,),
      _buildView(Icons.settings,"General",onTap:(){Navigator.of(context).pushNamed(AppRoutes.generalViewScreen);}),
      _buildView(Icons.draw,"Themes",onTap:(){Navigator.of(context).pushNamed(AppRoutes.themesViewScreen);}),
      _buildView(Icons.shopping_bag,"Archive Habits",onTap:(){Navigator.of(context).pushNamed(AppRoutes.archivedViewScreen);}),
      _buildView(Icons.reorder_outlined,"ReOrder Habits",onTap:(){print("print tapped");}),
      _buildView(Icons.login,"Import Data",onTap:(){print("print tapped");}),

    ],),
  );
}

Widget _buildView(IconData icon, String text, {required VoidCallback onTap}) {
  return Padding(padding: EdgeInsets.only(left: 8.0,right: 8.0),
    child: InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
        decoration: BoxDecoration(),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(children: [ Icon(icon, color: kPrimarykColors,),
                  const SizedBox(width: 10,),
                  Text(text, style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                  ),],),

                Icon(Icons.arrow_forward_ios_outlined, color: kPrimarykColors,size: 20,)
              ],
            ),
            Divider()
          ],
        ),
      ),
    ),);
}

Widget _buildContainerForBasics(BuildContext context){
  return Container(
    height: 250,
    width: 400,
    decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),color: kSeconderyColors,),
    child: Column(children: [
      SizedBox(height: 20,),
      _buildView(Icons.star,"Rate",onTap:(){print("print tapped");}),
      _buildView(Icons.lock,"Privacy",onTap:(){print("print tapped");}),
      _buildView(Icons.verified_user_sharp,"Your Suggestion",onTap:(){print("print tapped");}),
      _buildView(Icons.feedback,"Your Suggestion",onTap:(){print("print tapped");}),
    ],),
  );
}