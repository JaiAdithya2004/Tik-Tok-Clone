import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloudinary_public/cloudinary_public.dart';
import 'package:get/get.dart';
import 'package:tiktok_clone/constants.dart';
import 'package:tiktok_clone/models/video_model.dart';
import 'package:video_compress/video_compress.dart';

class UploadVideoController extends GetxController {
  Future<String> _uploadVideoToStorage(String id, String videoPath) async {
    // compress video first
    if (!await File(videoPath).exists()) {
      throw Exception("Video file does not exist");
    }

    final compressedVideo = await VideoCompress.compressVideo(
      videoPath,
      quality: VideoQuality.MediumQuality,
      deleteOrigin: false,
    );

    if (compressedVideo == null) {
      throw Exception("Video compression failed");
    }

    // setup cloudinary
    final cloudinary = CloudinaryPublic(
      'dp0wii5n7',
      'tiktok_clone',
      cache: false,
    );

    // upload to cloudinary
    CloudinaryResponse response = await cloudinary.uploadFile(
      CloudinaryFile.fromFile(
        compressedVideo.path!,
        resourceType: CloudinaryResourceType.Video,
        folder: 'videos',
        publicId: id,
      ),
    );

    // return the Cloudinary video URL
    return response.secureUrl;
  }

  Future<String> uploadThumbnailToStorage(String id, String videopath) async {
    final imageThumbnail = await VideoCompress.getFileThumbnail(videopath);

    final cloudinary = CloudinaryPublic(
      'dp0wii5n7',
      'tiktok_clone',
      cache: false,
    );

    if (!await imageThumbnail.exists()) {
      throw Exception("Thumbnail file not created at: ${imageThumbnail.path}");
    }

    // upload to cloudinary
    CloudinaryResponse response = await cloudinary.uploadFile(
      CloudinaryFile.fromFile(
        imageThumbnail.path,
        resourceType: CloudinaryResourceType.Image,
        folder: 'thumbnails',
        publicId: id,
      ),
    );
    return response.secureUrl;
  }

  uploadVideo(String songname, String caption, String videoPath) async {
    try {
      String uid = firebaseAuth.currentUser!.uid;
      DocumentSnapshot userDoc =
          await firestore.collection('users').doc(uid).get();

      var allDocs = await firestore.collection('videos').get();
      int len = allDocs.docs.length;
      final videoUrl = await _uploadVideoToStorage(
        "Video $uid $len",
        videoPath,
      );
      final thumbnailUrl = await uploadThumbnailToStorage(
        "Thumbnail $uid $len",
        videoPath,
      );
      Video video = Video(
        username: (userDoc.data() as Map<String, dynamic>)['name'],
        uid: uid,
        id: "Video $uid $len",
        likes: [],
        commentCount: 0,
        shareCount: 0,
        videoUrl: videoUrl,
        thumbnail: thumbnailUrl,
        songName: songname,
        caption: caption,
        profilePhoto: (userDoc.data() as Map<String, dynamic>)['profilePic'],
      );

      await firestore
          .collection('videos')
          .doc('Video $uid $len')
          .set(video.toMap());
      Get.snackbar("Uploaded Successfully", '');
    } catch (e) {
      Get.snackbar("Error uploading Video", e.toString());
    }
  }
}
