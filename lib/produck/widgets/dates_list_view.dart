import 'package:flutter/material.dart';
import 'package:habit_tracker/produck/widgets/date_list.dart';
import 'package:habit_tracker/produck/widgets/now_dates_container.dart';

class DatesListView extends StatelessWidget {
  const DatesListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        DateList(),
        NowDateContainer(),
      ],
    );
  }
}
