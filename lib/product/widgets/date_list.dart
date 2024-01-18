import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:habit_tracker/product/constants/color_constants.dart';
import 'package:habit_tracker/feautre/page/dates_screen/dates_page.dart';
import 'package:habit_tracker/product/widgets/date_container_text.dart';

class DateList extends StatelessWidget {
  const DateList({super.key});
  @override
  Widget build(BuildContext context) {
    // Firestore'dan tarihleri al
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance
          .collection('users')
          .doc(FirebaseAuth.instance.currentUser!.uid)
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

        // Bugünden önceki 29 gün önceki tarih
        DateTime thirtyDaysAgo =
            DateTime.now().subtract(const Duration(days: 29));

        // Bugün
        DateTime today = DateTime.now();
        print('bu günkü gün' + today.toString());

        // Tarihi filtrele
        List<DateTime> filteredDates = dates
            .map((date) => DateTime.parse(date.id))
            .where((dateDateTime) =>
                dateDateTime.isAfter(thirtyDaysAgo) &&
                dateDateTime.isBefore(today))
            .toList();
        print(filteredDates);

        return Container(
          height: 75,
          width: 350,
          decoration: BoxDecoration(
            color: ColorConstants.mineShaft,
          ),
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: filteredDates.length,
            itemBuilder: (context, index) {
              String formattedDate = "day ${filteredDates[index].day} ";
              String formattedMonth = "month ${filteredDates[index].month}";

              return GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => DatesPage(
                        docId: dates[index].id,
                        days: filteredDates[index].day.toString(),
                        month: filteredDates[index].month.toString(),
                      ),
                    ),
                  );
                },
                child: Container(
                  margin: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      DateText(date: formattedDate),
                      const SizedBox(height: 5),
                      DateText(date: formattedMonth)
                    ],
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }
}
