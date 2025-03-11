import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:medical_test_app/commons/components/buttons/app/floating_button__widget.dart';
import 'package:medical_test_app/commons/components/buttons/app/solid_button_widget.dart';
import 'package:medical_test_app/commons/components/navigation_bar/app/view/navigation_bar.dart';
import 'package:medical_test_app/commons/constants/app_colors.dart';
import 'package:medical_test_app/commons/constants/app_icons.dart';
import 'package:medical_test_app/pages/checkout_page/app/view/widgets/stepper_item.dart';

class MakePayment extends StatelessWidget {
  MakePayment({super.key});
  int currentStep = 3;

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
          const Expanded(
            child: Center(
              child: Text("No Payments gateway found"),
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            margin: const EdgeInsets.only(bottom: 21),
            child: Column(
              children: [
                SolidButtonWidget(
                  label: "Pay now",
                  onPressed: () {
                    context.push("/payment_success");
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
