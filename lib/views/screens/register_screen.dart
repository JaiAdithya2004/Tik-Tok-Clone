import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:tiktok_clone/constants.dart';
import 'package:tiktok_clone/views/screens/login_screen.dart';
import 'package:tiktok_clone/views/widgets/my_text_field.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({super.key});

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _userController = TextEditingController();

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
              "Register",
              style: TextStyle(fontSize: 35, fontWeight: FontWeight.w700),
            ),
            SizedBox(height: 20),
            Stack(
              children: [
                CircleAvatar(
                  radius: 60,
                  backgroundImage: NetworkImage(
                    'https://www.pngitem.com/pimgs/m/150-1503945_transparent-user-png-default-user-image-png-png.png',
                  ),
                ),
                Positioned(
                  bottom: -10,
                  left: 80,
                  child: IconButton(
                    onPressed: () => authController.pickImage(),
                    iconSize: 30,
                    icon: Icon(Icons.add_box_rounded),
                  ),
                ),
              ],
            ),
            SizedBox(height: 25),
            MyTextField(
              controller: _userController,
              label: "Username",
              icon: Icons.face_6_rounded,
            ),
            SizedBox(height: 25),
            MyTextField(
              controller: _emailController,
              label: "Email",
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
                  () => authController.registerUser(
                    username: _userController.text,
                    password: _passwordController.text,
                    email: _emailController.text,
                    img: authController.profilePhoto,
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
                    "Register",
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
                                builder: (context) => LoginScreen(),
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
