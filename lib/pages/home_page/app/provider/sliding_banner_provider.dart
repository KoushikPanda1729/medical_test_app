import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:medical_test_app/pages/home_page/app/viewmodel/sliding_banner_state.dart';
import 'package:medical_test_app/pages/home_page/app/viewmodel/sliding_banner_view_model.dart';

final slidingBannerProvider =
    StateNotifierProvider<SlidingBannerViewModel, SlidingBannerState>(
  (ref) => SlidingBannerViewModel(),
);
