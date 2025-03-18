import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:medical_test_app/commons/components/buttons/app/outline_button_widget.dart';
import 'package:medical_test_app/commons/components/buttons/app/solid_button_widget.dart';
import 'package:medical_test_app/commons/constants/app_colors.dart';
import 'package:medical_test_app/commons/constants/app_icons.dart';
import 'package:medical_test_app/pages/checkout_page/app/view/widgets/checkout_layout.dart';
import 'package:medical_test_app/pages/checkout_page/app/view/widgets/coupon_and_payment_summary.dart';
import 'package:medical_test_app/pages/checkout_page/app/view/widgets/test_summary_card.dart';

class CheckoutSummary extends StatelessWidget {
  const CheckoutSummary({super.key});

  @override
  Widget build(BuildContext context) {
    return CheckoutLayout(
      currentStep: 0,
      previousRoute: "/booking_details",
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Test Item Container
            TestSummaryCard(
              testName: 'Complete Blood Count (CBC)',
              price: '₹1399',
              onRemove: () {},
            ),

            const SizedBox(height: 13),
            SizedBox(
              width: 137,
              height: 28,
              child: OutlineButtonWidget(
                label: "Add More Test",
                onPressed: () {},
                isLeadingIcon: true,
                iconPath: AppIcons.plusSmall,
                borderColor: AppColors.teal,
                labelColor: AppColors.teal,
                isCircle: true,
              ),
            ),
            const SizedBox(height: 55),

            // Payment Details and Coupon Container
            CouponAndPaymentSummary(
              onViewCoupons: () {},
              subTotal: '₹1399',
              discount: '-₹500',
              totalPayable: '₹899',
            ),

            const SizedBox(height: 30),
            // Next Button
            SolidButtonWidget(
              label: "Next",
              onPressed: () {
                context.push("/add_member");
              },
              isCircle: true,
            )
          ],
        ),
      ),
    );
  }
}
