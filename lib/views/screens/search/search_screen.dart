import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:tiktok_clone/constants.dart';
import 'package:tiktok_clone/controllers/search/search_controller.dart';
import 'package:tiktok_clone/views/screens/profile/profile_screen.dart';

class SearchScreen extends StatelessWidget {
  SearchScreen({super.key});
  final SearchedController searchController = Get.put(SearchedController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Obx(() {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: buttonColor,
            title: TextFormField(
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.search),
                labelText: "Search",
              ),
              onFieldSubmitted: (value) => searchController.searchUsers(value),
            ),
          ),
          body:
              searchController.searchedUser.isEmpty
                  ? Center(
                    child: Text(
                      "Search for the user!!",
                      style: TextStyle(
                        color: buttonColor,
                        fontSize: 28,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  )
                  : ListView.builder(
                    itemCount: searchController.searchedUser.length,
                    itemBuilder: (context, index) {
                      final user = searchController.searchedUser[index];
                      return GestureDetector(
                        onTap:
                            () => Navigator.of(context).push(
                              MaterialPageRoute(
                                builder:
                                    (context) => ProfileScreen(uid: user.uuid),
                              ),
                            ),
                        child: ListTile(
                          leading: CircleAvatar(
                            backgroundImage: NetworkImage(user.profilePic),
                          ),
                          title: Text(user.name),
                        ),
                      );
                    },
                  ),
        );
      }),
    );
  }
}
