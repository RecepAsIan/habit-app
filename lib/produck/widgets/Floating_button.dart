import 'package:flutter/material.dart';
import 'package:habit_tracker/produck/constants/color_constants.dart';
import 'package:habit_tracker/feautre/page/habit_page.dart';

class FloatingButton extends StatelessWidget {
  const FloatingButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: SizedBox(),
            ),
            FloatingActionButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const HabitPage(),
                ));
              },
              backgroundColor: Colors.blue,
              shape: const StadiumBorder(side: BorderSide.none),
              child: const Icon(
                Icons.add_outlined,
                size: 30,
                color: ColorConstants.white,
              ),
            ),
          ],
        ),
        const SizedBox(height: 3)
      ],
    );
  }
}
