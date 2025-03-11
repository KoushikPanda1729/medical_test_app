import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:medical_test_app/commons/components/buttons/app/floating_button__widget.dart';
import 'package:medical_test_app/commons/components/buttons/app/outline_button_widget.dart';
import 'package:medical_test_app/commons/components/buttons/app/solid_button_widget.dart';
import 'package:medical_test_app/commons/components/navigation_bar/app/view/navigation_bar.dart';
import 'package:medical_test_app/commons/constants/app_colors.dart';
import 'package:medical_test_app/commons/constants/app_icons.dart';
import 'package:medical_test_app/pages/checkout_page/app/view/widgets/stepper_item.dart';

class SelectMemberScreen extends StatelessWidget {
  final List<Map<String, String>> members = [
    {"name": "Asha Yadav", "gender": "Female", "age": "35", "selected": "true"},
    {"name": "Kunal Yadav", "gender": "Male", "age": "40", "selected": "false"},
    {"name": "Ayush Yadav", "gender": "Male", "age": "8", "selected": "false"},
    {
      "name": "Sunita Yadav",
      "gender": "Female",
      "age": "60",
      "selected": "false"
    },
    {
      "name": "Mohanlal Yadav",
      "gender": "Male",
      "age": "69",
      "selected": "false"
    },
  ];
  int currentStep = 1;

  SelectMemberScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          NavBar(
            leadingIcon: FloatingButton(
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
            trailingIcon: const SizedBox(),
          ),
          const SizedBox(
            height: 13,
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                StepperItem(
                  step: 0,
                  currentStep: currentStep,
                  label: 'Add to Cart',
                  icon: AppIcons.shoppingCart,
                ),
                _buildStepperLine(0),
                StepperItem(
                  step: 1,
                  currentStep: currentStep,
                  label: 'Select Member',
                  icon: AppIcons.users,
                ),
                _buildStepperLine(1),
                StepperItem(
                  step: 2,
                  currentStep: currentStep,
                  label: 'Schedule Test',
                  icon: AppIcons.calendarDay,
                ),
                _buildStepperLine(2),
                StepperItem(
                  step: 3,
                  currentStep: currentStep,
                  label: 'Payment',
                  icon: AppIcons.creditCard,
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 36,
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  children: members
                      .map(
                        (member) => MemberTile(
                          name: member["name"]!,
                          gender: member["gender"]!,
                          age: member["age"]!,
                          isSelected: member["selected"] == "true",
                        ),
                      )
                      .toList(),
                ),
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            margin: const EdgeInsets.only(bottom: 21),
            child: Column(
              children: [
                SizedBox(
                  width: double.infinity,
                  height: 56,
                  child: OutlineButtonWidget(
                    label: "Add New Member(s)",
                    onPressed: () {},
                    isLeadingIcon: true,
                    iconPath: AppIcons.plusSmall,
                    borderColor: AppColors.teal,
                    labelColor: AppColors.teal,
                    isCircle: true,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                SolidButtonWidget(
                  label: "Next",
                  onPressed: () {
                    context.push("/add_schedule");
                  },
                  isCircle: true,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStepperLine(int step) {
    final isActive = step < currentStep;
    return Expanded(
        child: DottedBorder(
      color: isActive ? AppColors.teal : AppColors.black,
      dashPattern: const [6, 4],
      strokeWidth: 1.5,
      padding: EdgeInsets.zero,
      customPath: (size) {
        return Path()
          ..moveTo(0, size.height)
          ..lineTo(size.width, size.height);
      },
      child: const SizedBox(width: double.infinity),
    ));
  }
}

class MemberTile extends StatelessWidget {
  final String name;
  final String gender;
  final String age;
  final bool isSelected;

  const MemberTile({
    super.key,
    required this.name,
    required this.gender,
    required this.age,
    this.isSelected = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        border: Border.all(
            color: isSelected ? AppColors.teal : AppColors.lightTeal,
            width: isSelected ? 2 : 1),
        borderRadius: BorderRadius.circular(12),
        color: isSelected ? Colors.teal.withOpacity(0.1) : Colors.white,
      ),
      child: Row(
        children: [
          CircleAvatar(
            radius: 20,
            backgroundColor: Colors.grey[300],
            child: const Icon(Icons.person, color: Colors.teal),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
                Text(
                  "$gender, $age Yrs.",
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey[700],
                  ),
                ),
              ],
            ),
          ),
          if (isSelected)
            const Icon(
              Icons.check_circle,
              color: Colors.teal,
            ),
        ],
      ),
    );
  }
}
