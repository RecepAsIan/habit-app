import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:habit_tracker/app_states/nav_states/nav_states.dart';

class NavNotifer extends StateNotifier<NavStates> {
  NavNotifer() : super(const NavStates());
  void onIndexChanged(int index) {
    state = state.copywith(index: index);
  }

}
  final navProvider = StateNotifierProvider<NavNotifer, NavStates>(
    (ref) => NavNotifer(),
  );
