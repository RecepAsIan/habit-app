import 'package:flutter/material.dart';
import 'package:habit_tracker/feautre/auth/authpage/login_page.dart';
import 'package:habit_tracker/feautre/auth/authpage/register_page.dart';

class LoginOrRegister extends StatefulWidget {
  const LoginOrRegister({super.key});

  @override
  State<LoginOrRegister> createState() => _LoginOrRegisterPageState();
}

class _LoginOrRegisterPageState extends State<LoginOrRegister> {
  bool showLoginPage = true;
  void tooglepages() {
    setState(() {
      showLoginPage = !showLoginPage;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (showLoginPage) {
      return LoginPage(onPressed: tooglepages);
    } else {
      return RegistarPage(onPressed: tooglepages);
    }
  }
}
