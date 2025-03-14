import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:medical_test_app/commons/components/buttons/app/floating_button__widget.dart';
import 'package:medical_test_app/commons/components/buttons/app/outline_button_widget.dart';
import 'package:medical_test_app/commons/components/buttons/app/solid_button_widget.dart';
import 'package:medical_test_app/commons/components/navigation_bar/app/view/navigation_bar.dart';
import 'package:medical_test_app/commons/constants/app_colors.dart';
import 'package:medical_test_app/commons/constants/app_icons.dart';
import 'package:medical_test_app/pages/checkout_page/app/view/widgets/stepper_item.dart';

class SelectDateTimeAddressScreen extends StatelessWidget {
  SelectDateTimeAddressScreen({super.key});
  int currentStep = 2;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
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
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(child: DatePickerWidget()),
                      SizedBox(width: 10),
                      Expanded(child: TimePickerWidget()),
                    ],
                  ),
                  SizedBox(height: 42),
                  Text(
                    "Choose Address",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                  SizedBox(height: 10),
                  AddressTile(),
                ],
              ),
            ),
          ),
          const SizedBox(height: 10),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            margin: const EdgeInsets.only(bottom: 21),
            child: Column(
              children: [
                SizedBox(
                  width: double.infinity,
                  height: 56,
                  child: OutlineButtonWidget(
                    label: "Add New Address",
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
                    context.push("/make_payment");
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

class DatePickerWidget extends StatelessWidget {
  const DatePickerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Select date",
          style:
              TextStyle(fontSize: 16, height: 1, fontWeight: FontWeight.bold),
        ),
        const SizedBox(
          height: 4,
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 10),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.teal, width: 1),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "16/02/2025",
                style: TextStyle(fontSize: 14, color: Colors.black87),
              ),
              Container(
                padding: const EdgeInsets.all(7),
                decoration: BoxDecoration(
                  color: AppColors.teal, // Background c
                  borderRadius: BorderRadius.circular(12),
                ),
                child: SvgPicture.asset(
                  AppIcons.calendarDay,
                  colorFilter: const ColorFilter.mode(
                    AppColors.white,
                    BlendMode.srcIn,
                  ),
                  width: 15,
                  height: 15,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class TimePickerWidget extends StatelessWidget {
  const TimePickerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Select time",
          style:
              TextStyle(fontSize: 16, height: 1, fontWeight: FontWeight.bold),
        ),
        const SizedBox(
          height: 4,
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 10),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.teal, width: 1),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "12:30",
                style: TextStyle(fontSize: 14, color: Colors.black87),
              ),
              Container(
                padding: const EdgeInsets.all(7),
                decoration: BoxDecoration(
                  color: AppColors.teal, // Background c
                  borderRadius: BorderRadius.circular(12),
                ),
                child: SvgPicture.asset(
                  AppIcons.clock,
                  colorFilter: const ColorFilter.mode(
                    AppColors.white,
                    BlendMode.srcIn,
                  ),
                  width: 15,
                  height: 15,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class AddressTile extends StatelessWidget {
  const AddressTile({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(13),
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.teal, width: 1),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          const Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Address 1",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 2),
                Text(
                  "Q11M4+R89, Talaswar, Jharkhand 825311",
                  style: TextStyle(fontSize: 14, color: Colors.grey),
                ),
              ],
            ),
          ),
          Column(
            children: [
              SvgPicture.asset(
                AppIcons.check,
                colorFilter: const ColorFilter.mode(
                  AppColors.teal,
                  BlendMode.srcIn,
                ),
                width: 18,
                height: 18,
              ),
              const SizedBox(height: 13),
              SvgPicture.asset(
                AppIcons.pencil,
                colorFilter: const ColorFilter.mode(
                  AppColors.teal,
                  BlendMode.srcIn,
                ),
                width: 18,
                height: 18,
              ),
            ],
          )
        ],
      ),
    );
  }
}

class AddAddressButton extends StatelessWidget {
  const AddAddressButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.teal, width: 1.5),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Icon(Icons.add, color: Colors.teal),
          SizedBox(width: 5),
          Text(
            "Add New Address",
            style: TextStyle(
              fontSize: 14,
              color: Colors.teal,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
