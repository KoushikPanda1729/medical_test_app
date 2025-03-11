import 'package:flutter_riverpod/flutter_riverpod.dart';

final checkoutProvider = StateNotifierProvider<CheckoutNotifier, int>(
  (ref) => CheckoutNotifier(),
);

class CheckoutNotifier extends StateNotifier<int> {
  CheckoutNotifier() : super(0);

  void nextStep() {
    if (state < 3) state++;
  }

  void previousStep() {
    if (state > 0) state--;
  }
}
