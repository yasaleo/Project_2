import 'package:flutter/material.dart';

import '../constants/constants.dart';
import 'animated_follow_button.dart';
import 'custom_cached_image.dart';

class UserTile extends StatelessWidget {
  const UserTile({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const ListTile(
      title: Text(
        "username 1",
        style: Constants.TEXTSTYLE_WHITE,
      ),
      trailing: AnimatedFollwButton(),
      leading: ClipOval(
        child: Material(
          color: Colors.transparent,
          child: CustomCachedImage(
            imageUrl:
                'https://res.cloudinary.com/dyhk7g1gq/image/upload/v1672122435/r02s36x0nw6nkrdzex67.jpg',
            height: 50,
            width: 50,
            size: 25,
          ),
        ),
      ),
    );
  }
}
