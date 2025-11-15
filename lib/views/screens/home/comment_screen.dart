// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:tiktok_clone/constants.dart';
import 'package:timeago/timeago.dart' as timeago;

import 'package:tiktok_clone/controllers/comment/comment_controller.dart';

class CommentScreen extends StatelessWidget {
  String postId;
  CommentScreen({Key? key, required this.postId}) : super(key: key);
  TextEditingController _commentController = TextEditingController();
  CommentController commentController = Get.put(CommentController());

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    commentController.updatePostId(postId);
    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
          height: size.height,
          width: size.width,

          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Obx(() {
                  return ListView.builder(
                    shrinkWrap: true,
                    itemCount: commentController.comments.length,
                    itemBuilder: (context, index) {
                      final comment = commentController.comments[index];
                      return ListTile(
                        leading: CircleAvatar(
                          backgroundColor: Colors.black,
                          child: Image.network(comment.profilePic),
                        ),
                        title: Row(
                          children: [
                            Text(
                              "${comment.username} ",
                              style: TextStyle(
                                color: Colors.red,
                                fontSize: 20,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            Text(
                              comment.comment,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ],
                        ),
                        subtitle: Row(
                          children: [
                            Text(
                              timeago.format(comment.datePublished.toDate()),
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 15,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            SizedBox(width: 20),
                            Text(
                              "${comment.likes.length} likes",
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 16,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ],
                        ),
                        trailing: IconButton(
                          onPressed:
                              () => commentController.likeComment(comment.id),
                          icon: Icon(
                            Icons.favorite,
                            size: 28,
                            color:
                                comment.likes.contains(
                                      firebaseAuth.currentUser!.uid,
                                    )
                                    ? Colors.red
                                    : Colors.white,
                          ),
                        ),
                      );
                    },
                  );
                }),

                Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: _commentController,
                        decoration: InputDecoration(labelText: "Comment"),
                      ),
                    ),
                    TextButton(
                      onPressed:
                          () => commentController.postComment(
                            _commentController.text,
                          ),
                      child: Text("Send"),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
