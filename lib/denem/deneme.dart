import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class firebase extends StatefulWidget {
  const firebase({super.key});

  @override
  State<firebase> createState() => _firebaseState();
}

class _firebaseState extends State<firebase> {
  final db = FirebaseFirestore.instance;
  void deneme(params) {
    final docRef = db.collection("cities").doc("SF");
    docRef.get().then(
      (DocumentSnapshot doc) {
        final data = doc.data() as Map<String, dynamic>;

        // ...
        return Text(data['asdassd']);
      },
      onError: (e) => print("Error getting document: $e"),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
