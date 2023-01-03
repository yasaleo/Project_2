import 'package:flutter/material.dart';
import 'package:project_2/dataLayer/model/logged_user_details.dart';
import 'package:project_2/presentation/constants/constants.dart';

import '../widgets/animated_follow_button.dart';
import '../widgets/custom_cached_image.dart';

class FollowingListScreen extends StatelessWidget {
  const FollowingListScreen({super.key, required this.followingList});
  final List<LoggedUserModelFollowing> followingList;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Constants.COLOR_BLACK,
      appBar: AppBar(
        backgroundColor: Constants.COLOR_BLACK,
        title: const Text("Following", style: Constants.TEXTSTYLE_WHITE),
      ),
      body:followingList.isEmpty? const Center(
              child: Text("No following"),
            ): ListView.builder(
        itemBuilder: (context, index) {
          final following = followingList[index];
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: ListTile(
              title:  Text(
                following.follow!.name!,
                style: Constants.TEXTSTYLE_WHITE,
              ),
              trailing: AnimatedFollwButton(),
              leading:  ClipOval(
                child: Material(
                  color: Colors.transparent,
                  child: CustomCachedImage(
                    imageUrl:following.follow!.profilePic!
                        ,
                    height: 50,
                    width: 50,
                    size: 25,
                  ),
                ),
              ),
            ),
          );
        },
        itemCount: followingList.length,
      ),
    );
  }
}
