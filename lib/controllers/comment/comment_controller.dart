import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:tiktok_clone/constants.dart';
import 'package:tiktok_clone/models/comment_model.dart';

class CommentController extends GetxController {
  Rx<List<Comment>> _comments = Rx<List<Comment>>([]);

  List<Comment> get comments => _comments.value;

  String _postId = "";

  updatePostId(String id) {
    _postId = id;
    getComment();
  }

  getComment() async {
    _comments.bindStream(
      firestore
          .collection('videos')
          .doc(_postId)
          .collection('comments')
          .snapshots()
          .map((QuerySnapshot query) {
            List<Comment> retValue = [];

            for (var element in query.docs) {
              retValue.add(
                Comment.fromMap(element.data() as Map<String, dynamic>),
              );
            }
            return retValue;
          }),
    );
  }

  postComment(String commentText) async {
    try {
      if (commentText.isNotEmpty) {
        final uid = firebaseAuth.currentUser!.uid;
        DocumentSnapshot userDoc =
            await firestore.collection('users').doc(uid).get();
        var allDocs =
            await firestore
                .collection('videos')
                .doc(_postId)
                .collection('comments')
                .get();
        int len = allDocs.docs.length;

        Comment comment = Comment(
          comment: commentText,
          username: (userDoc as dynamic)['name'],
          likes: [],
          profilePic: (userDoc as dynamic)['profilePic'],
          uid: uid,
          id: "Comment $len",
          datePublished: DateTime.now(),
        );

        await firestore
            .collection('videos')
            .doc(_postId)
            .collection('comments')
            .doc('Comment $len')
            .set(comment.toMap());

        final doc = await firestore.collection('videos').doc(_postId).get();
        await firestore.collection('videos').doc(_postId).update({
          'commentCount': (doc.data() as dynamic)['commentCount'] + 1,
        });
      }
    } catch (e) {
      Get.snackbar('Error While Commenting', e.toString());
    }
  }

  likeComment(String commentId) async {
    final doc =
        await firestore
            .collection('videos')
            .doc(_postId)
            .collection('comments')
            .doc(commentId)
            .get();

    final uid = firebaseAuth.currentUser!.uid;
    if ((doc.data() as dynamic)['likes'].contains(uid)) {
      await firestore
          .collection('videos')
          .doc(_postId)
          .collection('comments')
          .doc(commentId)
          .update({
            'likes': FieldValue.arrayRemove([uid]),
          });
    } else {
      await firestore
          .collection('videos')
          .doc(_postId)
          .collection('comments')
          .doc(commentId)
          .update({
            'likes': FieldValue.arrayUnion([uid]),
          });
    }
  }
}
