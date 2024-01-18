import 'package:flutter/material.dart';
import 'package:habit_tracker/product/constants/color_constants.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.codGray,
      body: Center(
          child: Text(
        'deneme',
        style: TextStyle(color: Colors.amber),
      )),
    );
  }
}
