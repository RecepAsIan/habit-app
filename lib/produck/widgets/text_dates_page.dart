import 'package:flutter/material.dart';
import 'package:habit_tracker/produck/constants/color_constants.dart';

class TextDatesPage extends StatelessWidget {
  const TextDatesPage({
    super.key,
    required this.text,
  });

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(
        color: ColorConstants.boulder,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
