import 'package:flutter/material.dart';
import 'package:project_2/data_layer/repositeries/repositories.dart';
import 'package:project_2/data_layer/model/logged_user_details.dart';
import 'package:project_2/presentation/constants/constants.dart';
import 'package:project_2/presentation/followers_list/followers_list_screen.dart';
import 'package:project_2/presentation/widgets/text_widgets.dart';

import '../../../data_layer/model/logged_user_postlist.dart';
import '../../following_list/following_list_screen.dart';
import '../../widgets/custom_cached_image.dart';
import '../../widgets/profile_edit_button.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({
    super.key,
  });

  final getuserdetails = Repositories();

  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Constants.COLOR_SCAFFOLD_BACKGROUND,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Constants.COLOR_BLACK,
        title: const Text("Profile",
            style: TextStyle(
              color: Constants.COLOR_WHITE,
            )),
      ),
      body: Center(
        child: FutureBuilder(
            key: UniqueKey(),
            future: getuserdetails.getLoggedUserDetails(),
            builder: (BuildContext context,
                AsyncSnapshot<LoggedUserModel> snapshot) {
              if (snapshot.connectionState == ConnectionState.done &&
                  snapshot.hasData) {
                final details = snapshot.requireData;

                return ListView(
                  physics: const BouncingScrollPhysics(),
                  children: [
                    _profilePicture(details),
                    _profileDetails(context, details),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 15,
                      ),
                      child: _userPosts(details),
                    )
                  ],
                );
              }

              if (snapshot.connectionState == ConnectionState.active ||
                  snapshot.connectionState == ConnectionState.waiting) {
                return Constants.CIRCULARINDICATOR;
              }
              if (snapshot.error == true) {
                return Constants.CIRCULARINDICATOR;
              }
              return Constants.CIRCULARINDICATOR;
            }),
      ),
    );
  }

  FutureBuilder<List<LoggedUserPosts>> _userPosts(LoggedUserModel details) {
    return FutureBuilder(
        future: Repositories().getLoggedUserPosts(id: details.id!),
        builder: (BuildContext context,
            AsyncSnapshot<List<LoggedUserPosts>> snapshot) {
          if (snapshot.hasData) {
            final posts = snapshot.requireData;
            return GridView.builder(
              physics:
                  const NeverScrollableScrollPhysics(), // to disable GridView's scrolling
              shrinkWrap: true,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
              ),
              itemBuilder: (context, index) {
                return ClipRRect(
                  borderRadius: Constants().BORDERCURVE,
                  child: CustomCachedImage(
                    imageUrl: posts[index].image!,
                    height: 150,
                    width: 150,
                    size: 100,
                  ),
                );
              },
              itemCount: posts.length,
            );
          }
          return Constants.CIRCULARINDICATOR;
        });
  }

  Column _profileDetails(BuildContext context, LoggedUserModel details) {
    return Column(
      children: [
        TextSemiBold(
          content: details.name!,
          fontsize: 30,
          color: Constants.COLOR_WHITE,
        ),
        Constants.HEIGHT10,
        Text(
          "${details.email}",
          style: const TextStyle(color: Constants.COLOR_WHITE),
        ),
        Constants.HEIGHT10,
        followDetails(context, details),
        const Divider(
          color: Constants.COLOR_WHITE,
          thickness: .8,
          endIndent: 15,
          indent: 15,
        ),
        Constants.HEIGHT10,
      ],
    );
  }

  IntrinsicHeight followDetails(BuildContext context, LoggedUserModel details) {
    return IntrinsicHeight(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          InkWell(
            splashColor: Constants.COLOR_GREYISH,
            borderRadius: BorderRadius.circular(15),
            radius: 40,
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => FollowingListScreen(
                  followingList: details.following!,
                ),
              ));
            },
            child: Column(
              children: [
                Text(
                  "${details.following!.length}",
                  style: const TextStyle(color: Constants.COLOR_WHITE),
                ),
                const Text(
                  "Following",
                  style: TextStyle(color: Constants.COLOR_WHITE),
                )
              ],
            ),
          ),
          const VerticalDivider(
            color: Constants.COLOR_WHITE,
            endIndent: 7,
            indent: 7,
          ),
          InkWell(
            splashColor: Constants.COLOR_GREYISH,
            borderRadius: BorderRadius.circular(15),
            radius: 40,
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => FollowersListScreen(
                  followerList: details.followers!,
                ),
              ));
            },
            child: Column(
              children: [
                Text(
                  "${details.followers!.length}",
                  style: const TextStyle(color: Constants.COLOR_WHITE),
                ),
                const Text(
                  "Followers",
                  style: TextStyle(color: Constants.COLOR_WHITE),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Stack _profilePicture(LoggedUserModel details) {
    return Stack(
      children: [
        Center(
          child: ClipOval(
            child: Material(
              color: Colors.transparent,
              child: CustomCachedImage(
                imageUrl: details.profilePic!,
                height: 150,
                width: 150,
                size: 100,
              ),
            ),
          ),
        ),
        const Positioned(
          top: 110,
          left: 230,
          child: ProfileEditButton(),
        )
      ],
    );
  }
}
