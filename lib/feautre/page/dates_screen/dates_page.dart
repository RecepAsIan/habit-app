import 'package:flutter/material.dart';
import 'package:habit_tracker/product/constants/color_constants.dart';
import 'package:habit_tracker/product/widgets/Floating_button.dart';
import 'package:habit_tracker/product/widgets/dates_list_view.dart';
import 'package:habit_tracker/product/widgets/habit_container.dart';
import 'package:habit_tracker/product/widgets/text_dates_page.dart';

class DatesPage extends StatefulWidget {
  final String docId;
  final String days;
  final String month;

  const DatesPage({
    super.key,
    required this.docId,
    required this.days,
    required this.month,
  });

  @override
  State<DatesPage> createState() => _DatesPageState();
}

class _DatesPageState extends State<DatesPage> {
  @override
  Widget build(BuildContext context) {
    List<String> monthName = [
      'Ocak',
      'Şubat',
      'Mart',
      'Nisan',
      'Mayıs',
      'Haziran',
      'Temmuz',
      'Ağustos',
      'Eylül',
      'Ekim ',
      'Kasım ',
      'Aralık'
    ];
    final int monthInt = int.parse(widget.month) - 1;
    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorConstants.codGray,
        body: Column(
          children: [
            Expanded(
              child: Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextDatesPage(text: monthName[monthInt]),
                      const SizedBox(width: 6),
                      TextDatesPage(text: widget.days),
                    ],
                  ),
                  const HabitContainer(
                    leadingIcon: Icons.run_circle_outlined,
                    subtitleText: '0/3 km ',
                    titleText: 'Koşmak',
                    trailingText: 'başarılı',
                  ),
                ],
              ),
            ),
            const FloatingButton(),
            const DatesListView(),
          ],
        ),
      ),
    );
  }
}
