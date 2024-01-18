import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:habit_tracker/feautre/page/current_time_screen/current_time_page.dart';
import 'package:intl/intl.dart';

class CurrentTimeNotifier extends StateNotifier<CurrentTimePage> {
  CurrentTimeNotifier() : super(const CurrentTimePage());
  final DateTime toDay = DateTime.now();

  final FirebaseFirestore fireStore = FirebaseFirestore.instance;
  final String firstDocId = FirebaseAuth.instance.currentUser!.uid;

  String secondDocID() {
    final String formattedDate = DateFormat('yyyy-MM-dd').format(toDay);
    final String secondId = ('${formattedDate}T17:13:10.000Z');
    return secondId;
  }
}
