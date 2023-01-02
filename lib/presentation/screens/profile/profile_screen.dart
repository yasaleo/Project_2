import 'package:flutter/material.dart';
import 'package:project_2/dataLayer/auth_services.dart';
import 'package:project_2/dataLayer/model/logged_user_details.dart';
import 'package:project_2/presentation/constants/constants.dart';
import 'package:project_2/presentation/followers_list/followers_list_screen.dart';
import 'package:project_2/presentation/widgets/text_widgets.dart';

import '../../following_list/following_list_screen.dart';
import '../../widgets/custom_cached_image.dart';
import '../../widgets/profile_edit_button.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({
    super.key,
  });

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final getuserdetails = Authsevices();
  // LoggedUserDetails details = LoggedUserDetails();
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
            future: getuserdetails.getLoggedUserDetails(),
            builder: (BuildContext context,
                AsyncSnapshot<LoggedUserDetails> snapshot) {
              final details = snapshot.requireData;
              if (snapshot.connectionState == ConnectionState.done) {
                return ListView(
                  physics: const BouncingScrollPhysics(),
                  children: [
                    profilePicture(),
                    profileDetails(context),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 15,
                      ),
                      child: GridView.builder(
                        physics:
                            const NeverScrollableScrollPhysics(), // to disable GridView's scrolling
                        shrinkWrap: true,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 10,
                          mainAxisSpacing: 10,
                        ),
                        itemBuilder: (context, index) {
                          return ClipRRect(
                            borderRadius: Constants().BORDERCURVE,
                            child: const CustomCachedImage(
                              imageUrl:
                                  "https://res.cloudinary.com/dyhk7g1gq/image/upload/v1672122435/r02s36x0nw6nkrdzex67.jpg",
                              height: 150,
                              width: 150,
                              size: 100,
                            ),
                          );
                        },
                        itemCount: 30,
                      ),
                    )
                  ],
                );
              }

              if (snapshot.connectionState == ConnectionState.active ||
                  snapshot.connectionState == ConnectionState.waiting) {
                return CircularProgressIndicator();
              }
            }),
      ),
    );
  }

  Column profileDetails(BuildContext context) {
    return Column(
      children: [
        TextSemiBold(
          content: "${details.name}",
          fontsize: 30,
          color: Constants.COLOR_WHITE,
        ),
        Constants.HEIGHT10,
        Text(
          "${details.email}",
          style: const TextStyle(color: Constants.COLOR_WHITE),
        ),
        Constants.HEIGHT10,
        followDetails(context),
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

  IntrinsicHeight followDetails(BuildContext context) {
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
                builder: (context) => const FollowingListScreen(),
              ));
            },
            child: Column(
              children: [
                // Text(
                //   "${details.following!.length}",
                //   style: const TextStyle(color: Constants.COLOR_WHITE),
                // ),
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
                builder: (context) => const FollowersListScreen(),
              ));
            },
            child: Column(
              children: [
                // Text(
                //   "${details.followers!.length}",
                //   style: const TextStyle(color: Constants.COLOR_WHITE),
                // ),
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

  Stack profilePicture() {
    return Stack(
      children: const [
        Center(
          child: ClipOval(
            child: Material(
              color: Colors.transparent,
              child: CustomCachedImage(
                imageUrl: """
        http://res.cloudinary.com/dyhk7g1gq/image/upload/v1672589025/acaxftwvuczpzvmj0drx.png
""",
                height: 150,
                width: 150,
                size: 100,
              ),
            ),
          ),
        ),
        Positioned(
          top: 110,
          left: 230,
          child: ProfileEditButton(),
        )
      ],
    );
  }
}
