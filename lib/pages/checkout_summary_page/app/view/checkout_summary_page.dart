import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:medical_test_app/commons/components/buttons/app/outline_button_widget.dart';
import 'package:medical_test_app/commons/components/buttons/app/solid_button_widget.dart';
import 'package:medical_test_app/commons/components/open_custom_buttomsheet/open_custom_buttomsheet.dart';
import 'package:medical_test_app/commons/constants/app_colors.dart';
import 'package:medical_test_app/commons/constants/app_icons.dart';
import 'package:medical_test_app/pages/checkout_summary_page/app/provider/checkout_summary_provider.dart';
import 'package:medical_test_app/pages/checkout_summary_page/app/view/widget/apply_coupons_widget.dart';
import 'package:medical_test_app/pages/checkout_summary_page/app/view/widget/coupon_and_payment_summary.dart';
import 'package:medical_test_app/pages/checkout_summary_page/app/view/widget/test_summary_card.dart';

class CartSummaryStep extends ConsumerWidget {
  const CartSummaryStep({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final viewModel = ref.watch(checkoutProvider);
    final checkoutData = viewModel.state.checkoutData;

    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Test Item Container
            TestSummaryCard(
              testName: 'Complete Blood Count (CBC)',
              price: '₹1399',
              onRemove: () {
                // Handle remove test logic
              },
            ),

            const SizedBox(height: 13),
            SizedBox(
              width: 137,
              height: 28,
              child: OutlineButtonWidget(
                label: "Add More Test",
                onPressed: () {
                  context.push("/book_test");
                },
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
              onViewCoupons: () {
                openCustomBottomSheet(
                  context: context,
                  child: const ApplyCouponsWidget(),
                );
              },
              subTotal: checkoutData['subTotal'],
              discount: checkoutData['discount'],
              totalPayable: checkoutData['totalPayable'],
            ),

            const SizedBox(height: 30),
            // Next Button
            SolidButtonWidget(
              label: "Next",
              onPressed: () {
                // Move to next step
                viewModel.updateStep(viewModel.state.currentStep + 1);
              },
              isCircle: true,
            )
          ],
        ),
      ),
    );
  }
}
