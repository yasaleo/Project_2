import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

import '../../../data_layer/model/likes_model.dart';
import '../../../data_layer/repositeries/repositories.dart';
import '../constants/constants.dart';

class LikeButton extends StatefulWidget {
  const LikeButton({
    Key? key,
    required this.id,
  }) : super(key: key);

  final String id;

  @override
  State<LikeButton> createState() => _LikeButtonState();
}

class _LikeButtonState extends State<LikeButton> {
  LikesModel likes = LikesModel();
  bool isliked = false;
  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
      style: TextButton.styleFrom(
        foregroundColor: Constants.COLOR_BLACK,
      ),
      onPressed: () async {
        final rlike = await Repositories().addLike(id: widget.id);
        setState(() {
          likes = rlike;
          isliked = !isliked;
        });
      },
      icon: AnimatedSwitcher(
        switchInCurve: Curves.easeInBack,
        switchOutCurve: Curves.easeInBack,
        duration: const Duration(milliseconds: 500),
        child: Icon(
          Ionicons.heart_circle_outline,
          key: UniqueKey(),
          color: isliked
              ? const Color.fromARGB(255, 230, 0, 0)
              : Constants.COLOR_BLACK,
        ),
      ),
      label: FutureBuilder(
          future: Repositories().getLikeCount(id: widget.id),
          builder: (BuildContext context, AsyncSnapshot<LikesModel> snapshot) {
            if (snapshot.hasData) {
              final li = snapshot.requireData;
              return Text("${li.count} liked");
            }
            return const SizedBox(
              height: 10,
              width: 10,
              child: CircularProgressIndicator(
                color: Constants.COLOR_BLACK,
                strokeWidth: 2,
              ),
            );
          }),
    );
  }
}
