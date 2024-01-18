import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:habit_tracker/feautre/page/current_time_screen/current_time_page.dart';
import 'package:habit_tracker/product/constants/color_constants.dart';
import 'package:habit_tracker/product/widgets/date_container_text.dart';

class NowDateContainer extends StatelessWidget {
  const NowDateContainer({super.key});

  @override
  Widget build(BuildContext context) {
    final String userId = FirebaseAuth.instance.currentUser!.uid;
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance
          .collection('users')
          .doc(userId)
          .collection('dates')
          .snapshots(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator();
        }

        if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
          return const Center(
            child: Text('No dates found.'),
          );
        }

        List<QueryDocumentSnapshot> dates = snapshot.data!.docs;

        // Bugün
        DateTime today = DateTime.now();

        // Bugünkü tarih var mı kontrol et
        bool hasTodayDate = dates
            .any((date) => DateTime.parse(date.id).isAtSameMomentAs(today));

        return Container(
          child: hasTodayDate
              ? Container(
                  padding: const EdgeInsets.all(16.0),
                  decoration: const BoxDecoration(
                    color: ColorConstants.mineShaft,
                  ),
                  child: const Text(
                    'Today\'s date is already recorded!',
                    style: TextStyle(fontSize: 16.0),
                  ),
                )
              : Expanded(
                  child: GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => CurrentTimePage(),
                        ),
                      );
                    },
                    child: Container(
                      height: 75,
                      padding: const EdgeInsets.only(top: 5, left: 3),
                      decoration: const BoxDecoration(
                        color: ColorConstants.mineShaft,
                      ),
                      child: const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Center(child: DateText(date: 'Current')),
                          Center(child: DateText(date: 'time'))
                        ],
                      ),
                    ),
                  ),
                ),
        );
      },
    );
  }
}
