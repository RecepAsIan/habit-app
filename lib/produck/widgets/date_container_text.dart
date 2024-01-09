import 'package:flutter/material.dart';
import 'package:habit_tracker/produck/constants/color_constants.dart';

class DateText extends StatelessWidget {
  const DateText({
    super.key,
    required this.date,
  });

  final String date;

  @override
  Widget build(BuildContext context) {
    return Text(
      date,
      style: const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.bold,
          color: ColorConstants.white),
    );
  }
}
