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
    return Scaffold(
      backgroundColor: Colors.white,
      body: BlocProvider(
        create: (context) => HabbitAddingBloc(),
        child: BlocBuilder<HabbitAddingBloc, HabbitAddingState>(
          builder: (_, HabbitAddingState state) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Stack(
                children: [
                  ListView(
                    children: [
                      _addingName(context),
                      SizedBox(height: 20),
                      _addingDescriptionTextField(context),
                      SizedBox(height: 20),
                      _selectCategoryContainer(context),
                      SizedBox(height: 20),
                      HabitFrequencyCounter(habitName: '',),
                      SizedBox(height: 20),
                      SizedBox(
                        height: 250,
                        width: double.infinity,
                        child: IconSelectableView(),
                      ),
                      SizedBox(height: 20),
                      _colorViewSelectable(context),
                      SizedBox(height: 100),
                    ],
                  ),
                  Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: _buildSelectiveButton(context),
                  )
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _addingName(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: TextField(
        decoration: InputDecoration(
          filled: true,
          fillColor: kSeconderyColors,
          hintText: "Add Name",
          hintStyle: TextStyle(fontSize: 15, color: Colors.grey),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }

  Widget _addingDescriptionTextField(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: TextField(
        maxLines: 3,
        decoration: InputDecoration(
          filled: true,
          fillColor: kSeconderyColors,
          hintText: 'Description',
          hintStyle: TextStyle(fontSize: 15, color: Colors.grey),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }

  Widget _selectCategoryContainer(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
        color: kSeconderyColors,
      ),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Select Categories',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.grey,
              ),
            ),
            SizedBox(height: 10),
            GridView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
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
                      color: isSelected ? Colors.blue.shade50 : Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        color: isSelected ? Colors.blue : Colors.grey.shade300,
                      ),
                    ),
                    child: Stack(
                      children: [
                        Center(
                          child: Text(
                            category,
                            style: TextStyle(
                              color: isSelected ? Colors.blue : Colors.black87,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        if (isSelected)
                          Positioned(
                            top: 0,
                            right: 0,
                            child: GestureDetector(
                              onTap: () {
                                setState(() {
                                  _selectedCategories.remove(category);
                                });
                              },
                              child: Container(
                                padding: EdgeInsets.all(2),
                                child: Icon(
                                  Icons.close,
                                  color: Colors.blue,
                                  size: 16,
                                ),
                              ),
                            ),
                          ),
                      ],
                    ),
                  ),
                );
              },
            ),
            SizedBox(height: 10),
            Center(
              child: ElevatedButton.icon(
                onPressed: () => _showAddCategoryDialog(context),
                icon: Icon(Icons.add, size: 20),
                label: Text('Add New Category'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue.shade50,
                  foregroundColor: kPrimarykColors,
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                    side: BorderSide(color: Colors.blue.shade100),
                  ),
                ),
              ),
            ),
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
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          title: Text(
            'Add New Category',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          content: TextField(
            controller: categoryController,
            decoration: InputDecoration(
              hintText: 'Enter category name',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancel', style: TextStyle(color: Colors.grey)),
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
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: Text('Add'),
            ),
          ],
        );
      },
    );
  }

  Widget _buildSelectiveButton(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: ElevatedButton(
        onPressed: () {
          // TODO: Implement save/add logic
        },
        child: Text("Add Habit"),
        style: ElevatedButton.styleFrom(
          backgroundColor: CupertinoColors.white,
          foregroundColor: kPrimarykColors,
          padding: EdgeInsets.symmetric(vertical: 15),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          textStyle: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  // Add this to the existing color selection method
  Widget _colorViewSelectable(BuildContext context) {
    // Predefined color palette with a mix of vibrant and subtle colors
    final List<Color> colorPalette = [
      Color(0xFF5D3FD3), // Iris Purple
      Color(0xFF2E8B57), // Sea Green
      Color(0xFFFF6B6B), // Pastel Red
      Color(0xFF4ECDC4), // Turquoise
      Color(0xFFF9D71C), // Sunny Yellow
      Color(0xFF8A4FFF), // Vibrant Lavender
      Color(0xFFFF7F50), // Coral
      Color(0xFF1E90FF), // Dodger Blue
      Color(0xFFFF4500), // Orange Red
      Color(0xFF2ECC71), // Emerald Green
    ];

    Color? _selectedColor;

    return StatefulBuilder(
      builder: (context, setState) {
        return Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: kSeconderyColors,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.1),
                spreadRadius: 1,
                blurRadius: 5,
                offset: Offset(0, 3),
              ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Select Color',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
                SizedBox(height: 10),
                GridView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 5,
                    childAspectRatio: 1,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                  ),
                  itemCount: colorPalette.length,
                  itemBuilder: (context, index) {
                    final color = colorPalette[index];
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          _selectedColor = color;
                        });
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: color,
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                            color: _selectedColor == color
                                ? Colors.white
                                : color.withOpacity(0.5),
                            width: _selectedColor == color ? 3 : 1,
                          ),
                          boxShadow: _selectedColor == color
                              ? [
                            BoxShadow(
                              color: color.withOpacity(0.5),
                              spreadRadius: 2,
                              blurRadius: 5,
                            )
                          ]
                              : [],
                        ),
                        child: _selectedColor == color
                            ? Center(
                          child: Icon(
                            Icons.check,
                            color: Colors.white,
                            size: 24,
                          ),
                        )
                            : null,
                      ),
                    );
                  },
                ),
                if (_selectedColor != null) SizedBox(height: 10),
                if (_selectedColor != null)
                  Center(
                    child: Text(
                      'Selected Color',
                      style: TextStyle(
                        color: Colors.black87,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                if (_selectedColor != null) SizedBox(height: 5),
                if (_selectedColor != null)
                  Center(
                    child: Container(
                      width: 100,
                      height: 40,
                      decoration: BoxDecoration(
                        color: _selectedColor,
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
              ],
            ),
          ),
        );
      },
    );
  }
}