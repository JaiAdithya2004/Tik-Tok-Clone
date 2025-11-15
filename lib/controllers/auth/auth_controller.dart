import 'dart:convert';
import 'dart:io';

import 'package:cloudinary_public/cloudinary_public.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:tiktok_clone/constants.dart';
import 'package:tiktok_clone/models/user_model.dart' as model;
import 'package:tiktok_clone/views/screens/home/home_screen.dart';
import 'package:tiktok_clone/views/screens/login_screen.dart';

class AuthController extends GetxController {
  static AuthController instance = Get.find();

  final Rx<File?> _pickedImage = Rx<File?>(null);
  late Rx<User?> _user;

  @override
  void onReady() {
    super.onReady();
    _user = Rx<User?>(firebaseAuth.currentUser);
    _user.bindStream(firebaseAuth.authStateChanges());
    ever(_user, _setInitialScreen);
  }

  _setInitialScreen(User? user) {
    if (user == null) {
      Get.offAll(() => LoginScreen());
    } else {
      Get.offAll(() => HomeScreen());
    }
  }

  File? get profilePhoto => _pickedImage.value;

  void pickImage() async {
    final pickedImage = await ImagePicker().pickImage(
      source: ImageSource.gallery,
    );

    if (pickedImage != null) {
      Get.snackbar(
        "Profile Picture",
        "You have successully selected your profile picture",
      );
      _pickedImage.value = File(pickedImage.path);
    } else {
      Get.snackbar("Error", '');
    }
  }

  //

  Future<String> _uploadFile(File img, String userId) async {
    try {
      final cloudinary = CloudinaryPublic(
        'dp0wii5n7',
        'tiktok_clone',
        cache: false,
      );

      CloudinaryResponse response = await cloudinary.uploadFile(
        CloudinaryFile.fromFile(
          img.path,
          folder: 'profile_pictures',
          publicId: userId,
          resourceType: CloudinaryResourceType.Image,
        ),
      );
      return response.secureUrl;
    } catch (e) {
      print('💥 Exception during upload: $e');
      rethrow;
    }
  }

  void registerUser({
    required String username,
    required String password,
    required String email,
    required File? img,
  }) async {
    try {
      if (username.isNotEmpty &&
          password.isNotEmpty &&
          email.isNotEmpty &&
          img != null) {
        UserCredential cred = await firebaseAuth.createUserWithEmailAndPassword(
          email: email,
          password: password,
        );

        String downloadUrl = await _uploadFile(
          img,
          firebaseAuth.currentUser!.uid,
        );

        model.User user = model.User(
          name: username,
          uuid: firebaseAuth.currentUser!.uid,
          profilePic: downloadUrl,
          email: email,
        );

        await firestore
            .collection('users')
            .doc(cred.user!.uid)
            .set(user.toMap());
      }
    } catch (e) {
      Get.snackbar('Registration Error', e.toString());
      print(e.toString());
    }
  }

  void loginUser(String email, String password) async {
    try {
      if (email.isNotEmpty && password.isNotEmpty) {
        await firebaseAuth.signInWithEmailAndPassword(
          email: email,
          password: password,
        );

        Get.snackbar("Login Succesfull", "Congrats");
      } else {
        Get.snackbar("Error", "Please Fill in the Details");
      }
    } catch (e) {
      Get.snackbar("Error Occured", "Authenication Error ${e.toString()}");
    }
  }

  void signOut() async {
    await firebaseAuth.signOut();
  }
}
