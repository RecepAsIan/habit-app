import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:habit_tracker/product/constants/color_constants.dart';
import 'package:habit_tracker/product/widgets/dates_list_view.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.codGray,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Text(
                FirebaseAuth.instance.currentUser!.email.toString(),
                style: TextStyle(color: Colors.blue),
              ),
            ),
            const DatesListView(),
          ],
        ),
      ),
    );
  }
}
