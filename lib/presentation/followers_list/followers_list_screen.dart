import 'package:flutter/material.dart';
import 'package:project_2/data_layer/model/logged_user_details.dart';
import 'package:project_2/presentation/constants/constants.dart';

import '../../data_layer/repositeries/repositories.dart';
import '../widgets/animated_follow_button.dart';
import '../widgets/custom_cached_image.dart';

class FollowersListScreen extends StatelessWidget {
  const FollowersListScreen({super.key, required this.followerList});
  final List<LoggedUserModelFollower> followerList;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Constants.COLOR_BLACK,
      appBar: AppBar(
        backgroundColor: Constants.COLOR_BLACK,
        title: const Text("Followers", style: Constants.TEXTSTYLE_WHITE),
      ),
      body: followerList.isEmpty
          ? const Center(
              child: Text("No followers"),
            )
          : ListView.builder(
              itemBuilder: (context, index) {
                final follower = followerList[index];
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: ListTile(
                    title: Text(
                      follower.follower!.name!,
                      style: Constants.TEXTSTYLE_WHITE,
                    ),
                    trailing: AnimatedFollwButton(
                      onClick: () {
                        Repositories().folowRequest(id: follower.follower!.id!);
                        
                      },
                    ),
                    leading: ClipOval(
                      child: Material(
                        color: Colors.transparent,
                        child: CustomCachedImage(
                          imageUrl: follower.follower!.profilePic??"https://freesvg.org/img/abstract-user-flat-4.png",
                          height: 50,
                          width: 50,
                          size: 25,
                        ),
                      ),
                    ),
                  ),
                );
              },
              itemCount: followerList.length,
            ),
    );
  }
}
