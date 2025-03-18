import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:medical_test_app/commons/components/buttons/app/solid_button_widget.dart';
import 'package:medical_test_app/pages/checkout_page/app/view/widgets/checkout_layout.dart';

class MakePayment extends StatelessWidget {
  const MakePayment({super.key});

  @override
  Widget build(BuildContext context) {
    return CheckoutLayout(
      currentStep: 3,
      child: Column(
        children: [
          const Expanded(
            child: Center(
              child: Text("No Payments gateway found"),
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            margin: const EdgeInsets.only(bottom: 21),
            child: SolidButtonWidget(
              label: "Pay now",
              onPressed: () {
                context.push("/payment_success");
              },
              isCircle: true,
            ),
          ),
        ],
      ),
    );
  }
}
