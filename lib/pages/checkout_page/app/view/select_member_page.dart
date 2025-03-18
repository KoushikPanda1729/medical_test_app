import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:medical_test_app/commons/components/buttons/app/outline_button_widget.dart';
import 'package:medical_test_app/commons/components/buttons/app/solid_button_widget.dart';
import 'package:medical_test_app/commons/constants/app_colors.dart';
import 'package:medical_test_app/commons/constants/app_icons.dart';
import 'package:medical_test_app/pages/checkout_page/app/view/widgets/checkout_layout.dart';

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

  SelectMemberScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CheckoutLayout(
      currentStep: 1,
      child: Column(
        children: [
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
                const SizedBox(height: 10),
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
