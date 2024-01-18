import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:habit_tracker/product/constants/color_constants.dart';
import 'package:habit_tracker/product/widgets/Floating_button.dart';
import 'package:habit_tracker/product/widgets/dates_list_view.dart';
import 'package:habit_tracker/product/widgets/habit_dates_time_stream_builder.dart';
import 'package:intl/intl.dart';

class CurrentTimePage extends ConsumerStatefulWidget {
  const CurrentTimePage({
    super.key,
  });

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _CurrentTimePageState();
}

class _CurrentTimePageState extends ConsumerState<CurrentTimePage> {
  @override
  Widget build(BuildContext context) {
    final DateTime toDay = DateTime.now();
    final String formattedDate = DateFormat('yyyy-MM-dd').format(toDay);
    final String secondDocID = ('${formattedDate}T17:13:10.000Z');
    final FirebaseFirestore fireStore = FirebaseFirestore.instance;
    final String firstDocId = FirebaseAuth.instance.currentUser!.uid;

    return Scaffold(
      backgroundColor: ColorConstants.codGray,
      body: SafeArea(
        child: Column(
          children: [
            HabitDatesTimeStreamBuilder(
                fireStore: fireStore,
                firstDocId: firstDocId,
                secondDocID: secondDocID),
            const FloatingButton(),
            const DatesListView(),
          ],
        ),
      ),
    );
  }
}
