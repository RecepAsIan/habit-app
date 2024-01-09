import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:habit_tracker/produck/constants/color_constants.dart';
import 'package:habit_tracker/produck/widgets/Floating_button.dart';
import 'package:habit_tracker/produck/widgets/dates_list_view.dart';
import 'package:habit_tracker/produck/widgets/habit_container.dart';
import 'package:habit_tracker/produck/widgets/text_dates_page.dart';
import 'package:intl/intl.dart';

class CurrentTimePage extends StatefulWidget {
  const CurrentTimePage({
    super.key,
  });

  @override
  State<CurrentTimePage> createState() => _CurrentTimePageState();
}

class _CurrentTimePageState extends State<CurrentTimePage> {
  @override
  Widget build(BuildContext context) {
    final DateTime toDay = DateTime.now();
    final String formattedDate = DateFormat('yyyy-MM-dd').format(toDay);
    final String seconDocID = ('${formattedDate}T17:13:10.000Z');
    final FirebaseFirestore _firestore = FirebaseFirestore.instance;
    final String firstDocId = FirebaseAuth.instance.currentUser!.uid;

    return Scaffold(
      backgroundColor: ColorConstants.codGray,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Column(
                children: [
                  const Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextDatesPage(text: 'Today'),
                      SizedBox(width: 6),
                    ],
                  ),
                  StreamBuilder<QuerySnapshot>(
                    stream: _firestore
                        .collection('users')
                        .doc(firstDocId)
                        .collection('dates')
                        .doc(seconDocID)
                        .collection('habit')
                        .snapshots(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const CircularProgressIndicator();
                      }
                      if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                        return const Center(
                          child: Text('habit is empty pls habit add'),
                        );
                      }
                      return Expanded(
                       
                        child: ListView.builder(
                          itemCount: snapshot.data!.docs.length,
                          itemBuilder: (context, index) {
                            final dates = snapshot.data!.docs[index];
                            return HabitContainer(
                                trailingText: dates['trailingText'],
                                leadingIcon:
                                    Icons.check_box_outline_blank_outlined,
                                titleText: dates['titleText'],
                                subtitleText: dates['subtitleText']);
                          },
                        ),
                      );
                    },
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
