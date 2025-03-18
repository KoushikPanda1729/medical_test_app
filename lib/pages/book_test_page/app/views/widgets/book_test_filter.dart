import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:medical_test_app/commons/components/buttons/app/floating_button__widget.dart';
import 'package:medical_test_app/commons/components/buttons/app/solid_button_widget.dart';
import 'package:medical_test_app/commons/constants/app_colors.dart';
import 'package:medical_test_app/commons/constants/app_icons.dart';

class BookTestFilter extends StatefulWidget {
  final List<String> categories;
  final Function(List<String>) onApply;

  const BookTestFilter({
    super.key,
    required this.categories,
    required this.onApply,
  });

  @override
  BookTestFilterState createState() => BookTestFilterState();
}

class BookTestFilterState extends State<BookTestFilter> {
  List<String> selectedCategories = [];

  void _toggleSelection(String category) {
    setState(() {
      if (selectedCategories.contains(category)) {
        selectedCategories.remove(category);
      } else {
        selectedCategories.add(category);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              FloatingButton(
                onPressed: () {
                  context.pop();
                },
                iconPath: AppIcons.angleSmallRight,
                backgroundColor: AppColors.white,
                iconColor: AppColors.black,
                isDisabled: false,
                buttonSize: 42,
                iconSize: 20,
                isRotated: true,
              ),
              const Expanded(
                child: Center(
                  child: Text(
                    'Filter Category',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              const SizedBox(width: 42),
            ],
          ),
          const SizedBox(height: 29),
          Wrap(
            spacing: 10,
            runSpacing: 10,
            children: widget.categories.map((category) {
              final isSelected = selectedCategories.contains(category);
              return GestureDetector(
                onTap: () => _toggleSelection(category),
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                  decoration: BoxDecoration(
                    color: isSelected ? Colors.teal : Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: Colors.teal),
                  ),
                  child: Text(
                    category,
                    style: TextStyle(
                      color: isSelected ? Colors.white : Colors.teal,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              );
            }).toList(),
          ),
          const SizedBox(height: 55),
          SolidButtonWidget(
            label: "Apply",
            onPressed: () {
              context.pop();
            },
            isCircle: true,
          )
        ],
      ),
    );
  }
}
