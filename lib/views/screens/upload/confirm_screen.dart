import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:tiktok_clone/controllers/video/upload_video_controller.dart';
import 'package:tiktok_clone/views/widgets/my_text_field.dart';
import 'package:video_player/video_player.dart';

class ConfirmScreen extends StatefulWidget {
  final File videoFile;
  final String videoPath;
  const ConfirmScreen({
    super.key,
    required this.videoFile,
    required this.videoPath,
  });

  @override
  State<ConfirmScreen> createState() => _ConfirmScreenState();
}

class _ConfirmScreenState extends State<ConfirmScreen> {
  final TextEditingController songController = TextEditingController();
  final TextEditingController captionController = TextEditingController();
  late VideoPlayerController videoController;

  UploadVideoController uploadVideoController = Get.put(
    UploadVideoController(),
  );

  @override
  void initState() {
    super.initState();
    setState(() {
      videoController = VideoPlayerController.file(widget.videoFile);
    });
    videoController.initialize();
    videoController.play();
    videoController.setVolume(1);
    videoController.setLooping(true);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 50),
            SingleChildScrollView(
              child: Container(
                width: MediaQuery.of(context).size.width - 10,
                height: MediaQuery.of(context).size.height / 1.5,
                child: VideoPlayer(videoController),
              ),
            ),
            SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    MyTextField(
                      controller: songController,
                      icon: Icons.music_note,
                      label: "Song Name",
                    ),
                    SizedBox(height: 20),
                    MyTextField(
                      controller: captionController,
                      label: 'Caption',
                      icon: Icons.closed_caption,
                    ),
                    SizedBox(height: 20),
                    ElevatedButton(
                      onPressed:
                          () => uploadVideoController.uploadVideo(
                            songController.text,
                            captionController.text,
                            widget.videoPath,
                          ),
                      child: Text("Share"),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
