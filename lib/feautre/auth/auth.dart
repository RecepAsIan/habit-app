import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:habit_tracker/feautre/auth/login_or_register.dart';
import 'package:habit_tracker/product/widgets/bottom_nav/navigation_menu.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return const Bottombar();
        } else {
          return const LoginOrRegister();
        }
      },
    );
  }
}
