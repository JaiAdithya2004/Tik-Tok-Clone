import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tiktok_clone/constants.dart';
import 'package:tiktok_clone/views/screens/upload/confirm_screen.dart';

class AddVideoScreen extends StatelessWidget {
  const AddVideoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    pickVideo(ImageSource src, BuildContext context) async {
      final video = await ImagePicker().pickVideo(source: src);
      final file = File(video!.path);
      if (!file.existsSync()) {
        throw Exception("Video file does not exist at path:");
      }
      if (video != null) {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder:
                (context) => ConfirmScreen(
                  videoFile: File(video.path),
                  videoPath: video.path,
                ),
          ),
        );
      }
    }

    showOptionDialog(context) {
      return showDialog(
        context: context,
        builder:
            (context) => SimpleDialog(
              contentPadding: EdgeInsets.all(10),

              children: [
                SimpleDialogOption(
                  onPressed: () => pickVideo(ImageSource.gallery, context),
                  child: Text("Gallery"),
                ),
                SimpleDialogOption(
                  onPressed: () => pickVideo(ImageSource.camera, context),
                  child: Text("Camera"),
                ),
                SimpleDialogOption(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text("Cancel"),
                ),
              ],
            ),
      );
    }

    return Scaffold(
      body: GestureDetector(
        onTap: () => showOptionDialog(context),
        child: Center(
          child: Container(
            width: MediaQuery.of(context).size.width / 2,
            height: 60,
            decoration: BoxDecoration(
              color: buttonColor,
              borderRadius: BorderRadius.circular(5),
            ),
            child: Center(
              child: Text(
                "Add Video",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
