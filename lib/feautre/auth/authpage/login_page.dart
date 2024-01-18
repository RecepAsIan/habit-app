import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:habit_tracker/product/widgets/my_button.dart';
import 'package:habit_tracker/product/widgets/my_text_field.dart';

class LoginPage extends StatefulWidget {
  final void Function()? onPressed;
  const LoginPage({super.key, required this.onPressed});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  //SignIn
  void signIn() async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );
    } on FirebaseException catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            e.toString(),
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SingleChildScrollView(
        physics: const ClampingScrollPhysics(),
        child: SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 20),
                //login image
                Image.asset(
                  'assets/images/login.png',
                  width: 200,
                ),
                // email
                Padding(
                  padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
                  child: MyTextField(
                      controller: emailController,
                      text: 'Email',
                      obscureText: false),
                ),
                const SizedBox(height: 10),
                //password
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: MyTextField(
                      controller: passwordController,
                      text: 'Şifre',
                      obscureText: true),
                ),
                const SizedBox(height: 20),
                //login button
                MyButton(
                  onTap: signIn,
                  text: 'Giriş ',
                ),
                const SizedBox(height: 10),
                //register button
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Daha önce giriş yapmadınızmı ?',
                      style: TextStyle(fontSize: 15),
                    ),
                    TextButton(
                        onPressed: widget.onPressed,
                        child: const Text(
                          'kayıt ol',
                          style: TextStyle(
                              color: Colors.blue,
                              fontSize: 18,
                              fontWeight: FontWeight.bold),
                        ))
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
