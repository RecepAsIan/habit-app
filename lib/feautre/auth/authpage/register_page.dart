import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:habit_tracker/produck/widgets/my_button.dart';
import 'package:habit_tracker/produck/widgets/my_text_field.dart';

class RegistarPage extends StatefulWidget {
  final void Function()? onPressed;
  const RegistarPage({super.key, required this.onPressed});

  @override
  State<RegistarPage> createState() => _RegistarPageState();
}

class _RegistarPageState extends State<RegistarPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  void signUp() {
    if (passwordController.text != confirmPasswordController.text) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            'Şifreler eşleşmedi',
          ),
        ),
      );
    }
    try {
      FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: emailController.text, password: passwordController.text);
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
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const ClampingScrollPhysics(),
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
                const SizedBox(height: 10),
                //confirm password
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: MyTextField(
                      controller: confirmPasswordController,
                      text: 'Tekrar Şifre',
                      obscureText: true),
                ),
        
                const SizedBox(height: 20),
                //login button
                MyButton(
                  onTap: signUp,
                  text: 'Kayit ',
                ),
                const SizedBox(height: 10),
                //register button
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Daha önce kayıt oldunuzmu ?',
                      style: TextStyle(fontSize: 15),
                    ),
                    TextButton(
                        onPressed: widget.onPressed,
                        child: const Text(
                          'Giriş yap',
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
