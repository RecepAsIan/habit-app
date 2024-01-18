import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:habit_tracker/product/widgets/habit_container.dart';
import 'package:habit_tracker/product/widgets/text_dates_page.dart';

class HabitDatesTimeStreamBuilder extends StatelessWidget {
  const HabitDatesTimeStreamBuilder({
    super.key,
    required this.fireStore,
    required this.firstDocId,
    required this.secondDocID,
  });

  final FirebaseFirestore fireStore;
  final String firstDocId;
  final String secondDocID;

  @override
  Widget build(BuildContext context) {
    return Expanded(
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
            stream: fireStore
                .collection('users')
                .doc(firstDocId)
                .collection('dates')
                .doc(secondDocID)
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
    );
  }
}