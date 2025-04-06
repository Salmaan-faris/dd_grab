// lib/viewmodels/bottom_nav_viewmodel.dart
import 'package:riverpod/riverpod.dart';

final bottomNavProvider = StateNotifierProvider<BottomNavViewModel, int>((ref) {
  return BottomNavViewModel();
});

class BottomNavViewModel extends StateNotifier<int> {
  BottomNavViewModel() : super(0);

  void setIndex(int index) {
    state = index;
  }
}
