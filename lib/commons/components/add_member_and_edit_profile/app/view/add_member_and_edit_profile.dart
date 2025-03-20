import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:medical_test_app/commons/components/buttons/app/floating_button__widget.dart';
import 'package:medical_test_app/commons/components/buttons/app/solid_button_widget.dart';
import 'package:medical_test_app/commons/components/navigation_bar/app/view/navigation_bar.dart';
import 'package:medical_test_app/commons/components/text_fields/app/views/alpha_neumeric_text_field_widget.dart';
import 'package:medical_test_app/commons/components/text_fields/app/views/alphabetic_text_field_widget.dart';
import 'package:medical_test_app/commons/components/text_fields/app/views/dropdown_text_field.dart';
import 'package:medical_test_app/commons/components/text_fields/app/views/email_text_field_widget.dart';
import 'package:medical_test_app/commons/components/text_fields/app/views/numeric_text_field_widget.dart';
import 'package:medical_test_app/commons/constants/app_colors.dart';
import 'package:medical_test_app/commons/constants/app_icons.dart';

class AddMemberAndEditProfile extends StatelessWidget {
  final bool isEditMode;

  const AddMemberAndEditProfile({super.key, this.isEditMode = false});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
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
          Center(
            child: Text(
              isEditMode ? "Edit Profile" : "Add Family Member",
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(height: 22),
          Expanded(
            child: SingleChildScrollView(
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Center(
                          child: Stack(
                            children: [
                              const CircleAvatar(
                                radius: 40,
                                backgroundImage: AssetImage(
                                    "assets/profile_placeholder.png"),
                              ),
                              Positioned(
                                bottom: 0,
                                right: 0,
                                child: Container(
                                  decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.teal,
                                  ),
                                  padding: const EdgeInsets.all(6),
                                  child: const Icon(
                                    Icons.camera_alt,
                                    size: 18,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(width: 14),
                        Expanded(
                          child: AlphabeticTextfieldWidget(
                            onTextChanged: (value) {},
                            labelText: "Name",
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 22),
                    NumericTextfieldWidget(
                      onTextChanged: (value) {},
                      hintText: '98765 43210',
                    ),
                    const SizedBox(height: 15),
                    EmailTextfieldWidget(
                      onTextChanged: (value) {},
                      labelText: "Email",
                    ),
                    const SizedBox(height: 15),
                    Row(
                      children: [
                        Expanded(
                          child: AlphaNumericTextfieldWidget(
                            onTextChanged: (value) {},
                            labelText: "DD-MM-YYYY",
                          ),
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          child: NumericTextfieldWidget(
                            onTextChanged: (value) {},
                            hintText: 'Age',
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 15),
                    const Text("Gender"),
                    const SizedBox(height: 3),
                    Row(
                      children: [
                        buildGenderButton("Male", true),
                        const SizedBox(width: 10),
                        buildGenderButton("Female", false),
                      ],
                    ),
                    const SizedBox(height: 15),
                    Row(
                      children: [
                        Expanded(
                          child: AlphaNumericTextfieldWidget(
                            onTextChanged: (value) {},
                            labelText: "Height (ft/inch)",
                          ),
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          child: NumericTextfieldWidget(
                            onTextChanged: (value) {},
                            hintText: 'Weight (kg)',
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 15),
                    AlphaNumericTextfieldWidget(
                      onTextChanged: (value) {},
                      labelText: "House No./ Flat/ Building",
                    ),
                    const SizedBox(height: 15),
                    Row(
                      children: [
                        Expanded(
                          child: AlphaNumericTextfieldWidget(
                            onTextChanged: (value) {},
                            labelText: "Street Name",
                          ),
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          child: AlphaNumericTextfieldWidget(
                            onTextChanged: (value) {},
                            labelText: "Colony/ Area/ Secto",
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 15),
                    Row(
                      children: [
                        Expanded(
                          child: AlphabeticTextfieldWidget(
                            onTextChanged: (value) {},
                            labelText: "Post Office",
                          ),
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          child: AlphabeticTextfieldWidget(
                            onTextChanged: (value) {},
                            labelText: "Pincode",
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 15),
                    Row(
                      children: [
                        Expanded(
                          child: TextfieldDropdown(
                            label: "",
                            title: "Select City",
                            hintText: "City",
                            selectedItem: "",
                            items: const [
                              "Kolkata",
                              "Delhi",
                              "Mumbai",
                              "Bangalore",
                              "Chennai",
                            ],
                            onItemSelected: (value) {},
                            getDisplayText: (value) => value,
                          ),
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          child: TextfieldDropdown(
                            label: "",
                            title: "Select State",
                            hintText: "State",
                            selectedItem: "",
                            items: const [
                              "West Bengal",
                              "Delhi",
                              "Maharashtra",
                              "Karnataka",
                              "Tamil Nadu",
                            ],
                            onItemSelected: (value) {},
                            getDisplayText: (value) => value,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 15),
                    AlphaNumericTextfieldWidget(
                      onTextChanged: (value) {},
                      labelText: "Landmark (optional)",
                    ),
                    const SizedBox(height: 15),

                    // Change button text dynamically
                    SolidButtonWidget(
                      label: isEditMode ? "Update" : "Add",
                      onPressed: () {},
                    ),
                    const SizedBox(height: 22),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget buildGenderButton(String text, bool male) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        height: 38,
        width: 83,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: true
              ? [
                  const BoxShadow(
                    color: Color.fromRGBO(211, 211, 211, 0.7),
                    blurRadius: 1,
                    spreadRadius: 0.7,
                    offset: Offset(0, 0),
                  ),
                ]
              : [],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              male ? AppIcons.male : AppIcons.female,
              width: 18,
              height: 18,
              colorFilter: const ColorFilter.mode(
                Colors.teal,
                BlendMode.srcIn,
              ),
            ),
            const SizedBox(width: 4),
            Text(
              text,
              style: const TextStyle(
                color: Colors.teal,
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
