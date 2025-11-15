import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:tiktok_clone/constants.dart';
import 'package:tiktok_clone/models/user_model.dart';

class ProfileController extends GetxController {
  Rx<Map<String, dynamic>> _user = Rx<Map<String, dynamic>>({});

  Map<String, dynamic> get user => _user.value;

  final Rx<String> _uid = "".obs;

  getUid(String id) {
    _uid.value = id;
    getUserDetails();
  }

  getUserDetails() async {
    List<String> thumbnails = [];
    var myVideos =
        await firestore
            .collection('videos')
            .where('uid', isEqualTo: _uid.value)
            .get();
    for (int i = 0; i < myVideos.docs.length; i++) {
      thumbnails.add((myVideos.docs[i].data() as dynamic)['thumbnail']);
    }
    final DocumentSnapshot user =
        await firestore.collection('users').doc(_uid.value).get();
    User targetUser = User.fromSnap(user);
    var followers =
        await firestore
            .collection('users')
            .doc(_uid.value)
            .collection('followers')
            .get();
    var following =
        await firestore
            .collection('users')
            .doc(_uid.value)
            .collection('following')
            .get();

    var followersCount = followers.docs.length;
    var followingCount = following.docs.length;
    bool isFollowing = false;
    await firestore
        .collection('users')
        .doc(_uid.value)
        .collection('followers')
        .doc(firebaseAuth.currentUser!.uid)
        .get()
        .then((value) {
          if (value.exists) {
            isFollowing = true;
          } else {
            isFollowing = false;
          }
        });
    var likes = 0;
    for (var item in myVideos.docs) {
      likes += (item.data()['likes'] as List).length;
    }
    _user.value = {
      'name': targetUser.name,
      'profilePic': targetUser.profilePic,
      'thumbnails': thumbnails,
      'followers': followersCount,
      'followings': followingCount,
      'likes': likes,
      'isFollowing': isFollowing,
    };
    update();
  }

  followUser() async {
    DocumentSnapshot doc =
        await firestore
            .collection('users')
            .doc(_uid.value)
            .collection('followers')
            .doc(firebaseAuth.currentUser!.uid)
            .get();

    if (!doc.exists) {
      await firestore
          .collection('users')
          .doc(_uid.value)
          .collection('followers')
          .doc(firebaseAuth.currentUser!.uid)
          .set({});
      await firestore
          .collection('users')
          .doc(firebaseAuth.currentUser!.uid)
          .collection('following')
          .doc(_uid.value)
          .set({});
      _user.value.update('followers', (value) => value + 1);
    } else {
      await firestore
          .collection('users')
          .doc(_uid.value)
          .collection('followers')
          .doc(firebaseAuth.currentUser!.uid)
          .delete();
      await firestore
          .collection('users')
          .doc(firebaseAuth.currentUser!.uid)
          .collection('following')
          .doc(_uid.value)
          .delete();
      _user.value.update('followers', (value) => value - 1);
      _user.value.update('isFollowing', (value) => !value);
    }
  }
}
