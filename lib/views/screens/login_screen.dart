import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:tiktok_clone/constants.dart';
import 'package:tiktok_clone/views/screens/register_screen.dart';
import 'package:tiktok_clone/views/widgets/my_text_field.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Tiktok Clone",
              style: TextStyle(
                fontSize: 45,
                fontWeight: FontWeight.w400,
                color: buttonColor,
              ),
            ),
            Text(
              "Login",
              style: TextStyle(fontSize: 35, fontWeight: FontWeight.w700),
            ),
            SizedBox(height: 25),
            MyTextField(
              controller: _emailController,
              label: "email",
              icon: Icons.email,
            ),
            SizedBox(height: 25),
            MyTextField(
              controller: _passwordController,
              label: "Password",
              icon: Icons.lock,
              isObscure: true,
            ),
            SizedBox(height: 25),
            GestureDetector(
              onTap:
                  () => authController.loginUser(
                    _emailController.text,
                    _passwordController.text,
                  ),
              child: Container(
                height: 70,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: buttonColor,
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Center(
                  child: Text(
                    "Login",
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            RichText(
              text: TextSpan(
                style: TextStyle(fontSize: 20),
                children: [
                  TextSpan(text: "Already have an account?"),
                  TextSpan(
                    recognizer:
                        TapGestureRecognizer()
                          ..onTap = () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => RegisterScreen(),
                              ),
                            );
                          },

                    text: "  Login",
                    style: TextStyle(color: buttonColor),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
