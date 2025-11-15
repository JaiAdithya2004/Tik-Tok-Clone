import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:tiktok_clone/constants.dart';
import 'package:tiktok_clone/controllers/video/video_controller.dart';
import 'package:tiktok_clone/views/screens/home/comment_screen.dart';
import 'package:tiktok_clone/views/widgets/animation_circle.dart';
import 'package:tiktok_clone/views/widgets/my_video_player.dart';
import 'package:video_player/video_player.dart';

class VideoScreen extends StatelessWidget {
  VideoScreen({super.key});

  final videoController = Get.put(VideoController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() {
        return PageView.builder(
          scrollDirection: Axis.vertical,
          itemCount: videoController.videoList.length,
          itemBuilder: (context, index) {
            final video = videoController.videoList[index];
            return Stack(
              children: [
                MyVideoPlayer(videoUrl: video.videoUrl),
                Column(
                  children: [
                    const SizedBox(height: 100),
                    Expanded(
                      child: Row(
                        mainAxisSize: MainAxisSize.max,

                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 16.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Text(
                                  video.username,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 22,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(height: 5),
                                Text(video.caption),
                                SizedBox(height: 5),
                                Row(
                                  children: [
                                    Icon(Icons.music_note),
                                    SizedBox(width: 10),
                                    Text(video.songName),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),

                Positioned(
                  bottom: 1,
                  right: 1,
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        backgroundImage: NetworkImage(video.profilePhoto),
                        radius: 30,
                      ),
                      SizedBox(height: 30),
                      Column(
                        children: [
                          GestureDetector(
                            onTap: () => videoController.likeVideo(video.id),
                            child: Icon(
                              Icons.favorite,
                              size: 30,
                              color:
                                  video.likes.contains(
                                        firebaseAuth.currentUser!.uid,
                                      )
                                      ? Colors.red
                                      : Colors.white,
                            ),
                          ),
                          Text(video.likes.length.toString()),
                        ],
                      ),
                      SizedBox(height: 30),
                      Column(
                        children: [
                          GestureDetector(
                            onTap:
                                () => Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder:
                                        (context) =>
                                            CommentScreen(postId: video.id),
                                  ),
                                ),
                            child: Icon(
                              Icons.chat,
                              size: 30,
                              color: Colors.white,
                            ),
                          ),
                          Text(video.commentCount.toString()),
                        ],
                      ),
                      SizedBox(height: 30),
                      Column(
                        children: [
                          Icon(Icons.reply, size: 30, color: Colors.white),
                          Text(video.shareCount.toString()),
                        ],
                      ),
                      SizedBox(height: 30),
                      AnimationCircle(
                        child: Container(
                          width: 50,
                          height: 50,
                          decoration: BoxDecoration(
                            color: Colors.grey,
                            borderRadius: BorderRadius.circular(50),
                          ),
                          child: SizedBox(
                            height: 30,
                            width: 30,
                            child: Image.network(video.thumbnail),
                          ),
                        ),
                      ),
                      SizedBox(height: 30),
                    ],
                  ),
                ),
              ],
            );
          },
        );
      }),
    );
  }
}
