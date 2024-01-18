import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:habit_tracker/app_states/nav_states/nav_notifier.dart';
import 'package:habit_tracker/feautre/page/home_screen/home_page.dart';
import 'package:habit_tracker/feautre/page/progress_screen/progress_page.dart';
import 'package:habit_tracker/feautre/page/raise_screen/raise_page.dart';
import 'package:habit_tracker/feautre/page/settings_screen/settings_page.dart';

class Bottombar extends ConsumerStatefulWidget {
  const Bottombar({super.key});

  @override
  ConsumerState<Bottombar> createState() => _BottombarState();
}

class _BottombarState extends ConsumerState<Bottombar> {
  static final List<Widget> _widgetOptions = <Widget>[
    const HomePage(),
    const RaisePage(),
    const ProgressPage(),
    const SettingsPage(),
  ];

  @override
  Widget build(BuildContext context) {
    var navIndex = ref.watch(navProvider);
    return Scaffold(
      body: Center(
        child: _widgetOptions[navIndex.index],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: navIndex.index,
        onTap: (value) {
          ref.read(navProvider.notifier).onIndexChanged(value);
        },
        elevation: 10,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        type: BottomNavigationBarType.fixed,
        unselectedItemColor: const Color.fromARGB(255, 12, 201, 226),
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.access_alarm), label: 'home2'),
          BottomNavigationBarItem(
              icon: Icon(Icons.dangerous_sharp), label: 'home3'),
          BottomNavigationBarItem(
              icon: Icon(Icons.mic_external_off_outlined), label: 'home4'),
        ],
      ),
    );
  }
}
