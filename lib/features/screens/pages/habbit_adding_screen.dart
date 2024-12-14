import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trackroutine/config/incraseAndDecreaseService.dart';
import 'package:trackroutine/features/daily_routine/presentation/habitAdding/habbit_adding_bloc.dart';

import '../../../config/iconly.dart';
import '../../../constants/colors.dart';

class HabbitAddingScreen extends StatefulWidget {
  @override
  _HabbitAddingScreenState createState() => _HabbitAddingScreenState();
}

class _HabbitAddingScreenState extends State<HabbitAddingScreen> {
  final List<String> _predefinedCategories = [
    'Groceries',
    'Electronics',
    'Clothing',
    'Books',
    'Entertainment',
    'Food',
    'Travel',
    'Sports',
  ];

  final List<String> _selectedCategories = [];

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HabbitAddingBloc(),
      child: BlocBuilder<HabbitAddingBloc, HabbitAddingState>(
        builder: (_, HabbitAddingState state) {
          return Stack(
            children: [
              ListView(
                children: [
                  SizedBox(height: 20),
                  _addingName(context),
                  SizedBox(height: 20),
                  _addingDescriptionTextField(context),
                  SizedBox(height: 20),
                  _selectCategoryContainer(context),
                  // SizedBox(height: 20),
                  // ElevatedButton(
                  //   onPressed: () => _showAddCategoryDialog(context),
                  //   child: const Text("Add New Category"),
                  // ),
                  SizedBox(height: 20),
                  Incraseanddecreaseservice(),
                  SizedBox(height: 20),
                  SizedBox(height: 250,width: double.infinity,child: IconSelectableView(),),
                  SizedBox(height: 20),
                  _colorViewSelectable(context)

                ],
              ),
              Positioned(
                  bottom: 10,
                  child: _buildSelectiveButton(context))
            ],
          );
        },
      ),
    );
  }

  Widget _addingName(BuildContext context) {
    return Container(
      height: 50,
      width: 400,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: kSeconderyColors,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: TextFormField(
          decoration: const InputDecoration(border: InputBorder.none,
          hintText: "Add Name",
          hintStyle: TextStyle(fontSize: 15,color: Colors.grey)),
        ),
      ),
    );
  }

  Widget _addingDescriptionTextField(BuildContext context) {
    return Container(
      height: 100,
      width: 400,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: kSeconderyColors,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: TextFormField(
          maxLines: 3,
          decoration: const InputDecoration(border: InputBorder.none,
          hintText: 'Description',
          hintStyle: TextStyle(fontSize: 15,color: Colors.grey)),
        ),
      ),
    );
  }

  Widget _selectCategoryContainer(BuildContext context) {
    return Container(
      height: 250,
      width: 400,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: kSeconderyColors,
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Stack(
          children: [
            GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4,
                childAspectRatio: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
              ),
              itemCount: _predefinedCategories.length,
              itemBuilder: (context, index) {
                final category = _predefinedCategories[index];
                final isSelected = _selectedCategories.contains(category);
            
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      if (isSelected) {
                        _selectedCategories.remove(category);
                      } else {
                        _selectedCategories.add(category);
                      }
                    });
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: isSelected ? Colors.blue : Colors.white,
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(
                        color: isSelected ? Colors.blue : Colors.grey,
                      ),
                    ),
                    child: Center(
                      child: Text(
                        category,
                        style: TextStyle(
                          color: isSelected ? Colors.white : Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
            Positioned(
              bottom: 0,
                child: InkWell(onTap:(){_showAddCategoryDialog(context);},child: Container(
                  height: 40,
                  width: 140,
                  decoration: BoxDecoration(
                    color: CupertinoColors.white,
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: Colors.grey)
                  ),
                    child: Center(child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text('Add Manually'),
                        Icon(Icons.add)
                      ],
                    ))
                ),)
            )
          ],
        ),
      ),
    );
  }

  void _showAddCategoryDialog(BuildContext context) {
    final TextEditingController categoryController = TextEditingController();

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Add New Category'),
          content: TextField(
            controller: categoryController,
            decoration: const InputDecoration(
              hintText: 'Enter category name',
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () {
                if (categoryController.text.isNotEmpty) {
                  setState(() {
                    _predefinedCategories.add(categoryController.text);
                  });
                  Navigator.of(context).pop();
                }
              },
              child: const Text('Add'),
            ),
          ],
        );
      },
    );
  }
}

Widget _buildSelectiveButton(BuildContext context){
  return ElevatedButton(onPressed: (){}, child: Text("Add"),
    style: ElevatedButton.styleFrom(
      // backgroundColor: Colors.blue,   // Background color
      // foregroundColor: Colors.white, // Text color
      padding: EdgeInsets.symmetric(horizontal: 170, vertical: 10),
      textStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
    ),

  );
}

_colorViewSelectable(BuildContext context){
  return Container(
    height: 200,
    width: 400,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(10),
      color: kSeconderyColors,
    ),
  );
}