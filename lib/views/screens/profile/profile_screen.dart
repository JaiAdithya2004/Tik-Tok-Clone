// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:tiktok_clone/constants.dart';
import 'package:tiktok_clone/controllers/profile/profile_controller.dart';

class ProfileScreen extends StatefulWidget {
  String uid;
  ProfileScreen({Key? key, required this.uid}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final profileController = Get.put(ProfileController());

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    profileController.getUid(widget.uid);
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProfileController>(
      init: ProfileController(),
      builder: (controller) {
        if (controller.user.isEmpty) {
          return Center(child: CircularProgressIndicator());
        }
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.black,
            leading: Icon(Icons.person_add_alt_1_rounded),
            title: Text(
              controller.user['name'],
              style: TextStyle(color: Colors.white),
            ),
            actions: [Icon(Icons.more_horiz)],
          ),
          body: Column(
            children: [
              SizedBox(height: 30),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ClipOval(
                        child: CachedNetworkImage(
                          fit: BoxFit.cover,

                          width: 100,
                          height: 100,
                          imageUrl: controller.user['profilePic'],
                          placeholder:
                              (context, url) => Icon(Icons.person, size: 40),
                          errorWidget:
                              (context, url, error) => Icon(Icons.error),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 30),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        children: [
                          Text(
                            controller.user['followers'].toString(),
                            style: TextStyle(fontSize: 20),
                          ),
                          Text(
                            "Followers",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(width: 15),
                      Column(
                        children: [
                          Text(
                            controller.user['followings'].toString(),
                            style: TextStyle(fontSize: 20),
                          ),
                          Text(
                            "Following",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(width: 20),
                      Column(
                        children: [
                          Text(
                            controller.user['likes'].toString(),
                            style: TextStyle(fontSize: 20),
                          ),
                          Text(
                            "Likes",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  TextButton(
                    onPressed: () {
                      if (widget.uid == firebaseAuth.currentUser!.uid) {
                        authController.signOut();
                      } else {
                        profileController.followUser();
                      }
                    },
                    child: Text(
                      firebaseAuth.currentUser!.uid != widget.uid
                          ? controller.user['isFollowing']
                              ? 'Unfollow'
                              : 'Follow'
                          : 'Signout',
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
