import 'package:flutter/material.dart';
import 'package:medical_test_app/commons/constants/app_colors.dart';

class CategoryChips extends StatefulWidget {
  final List<String> categories;
  final ValueChanged<String>? onSelected;

  const CategoryChips({super.key, required this.categories, this.onSelected});

  @override
  CategoryChipsState createState() => CategoryChipsState();
}

class CategoryChipsState extends State<CategoryChips> {
  String? selectedCategory;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 6.0,
      runSpacing: 6.0,
      children: widget.categories.map((category) {
        final bool isSelected = selectedCategory == category;

        return GestureDetector(
          onTap: () {
            setState(() {
              selectedCategory = isSelected ? null : category;
            });

            if (widget.onSelected != null) {
              widget.onSelected!(category);
            }
          },
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
            decoration: BoxDecoration(
              color: isSelected ? const Color(0xFFD1EDEB) : AppColors.white,
              border: Border.all(color: AppColors.teal),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Text(
              category,
              style: TextStyle(
                color: isSelected ? AppColors.black : AppColors.teal,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        );
      }).toList(),
    );
  }
}
