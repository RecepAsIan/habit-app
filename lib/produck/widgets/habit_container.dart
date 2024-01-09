import 'package:flutter/material.dart';
import 'package:habit_tracker/produck/constants/color_constants.dart';

class HabitContainer extends StatelessWidget {
  const HabitContainer(
      {super.key,
      required this.trailingText,
      required this.leadingIcon,
      required this.titleText,
      required this.subtitleText});
  final String trailingText;
  final String titleText;
  final String subtitleText;
  final IconData leadingIcon;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          leading: Icon(
            leadingIcon,
            size: 45,
          ),
          title: Text(titleText, style: TextStyle(color: ColorConstants.white)),
          subtitle:
              Text(subtitleText, style: TextStyle(color: ColorConstants.white)),
          trailing: Container(
            padding: const EdgeInsets.only(left: 10, right: 10),
            height: 20,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(10),
                topLeft: Radius.circular(10),
                bottomRight: Radius.circular(10),
                topRight: Radius.circular(10),
              ),
              border: Border.all(color: ColorConstants.white),
            ),
            child: Text(trailingText),
          ),
        ),
        const Divider(
          color: ColorConstants.mineShaft2,
          thickness: 3,
        )
      ],
    );
  }
}
