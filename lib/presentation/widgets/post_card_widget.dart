import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:project_2/dataLayer/model/likes_model.dart';
import 'package:project_2/dataLayer/repositories.dart';
import 'package:project_2/presentation/widgets/text_widgets.dart';
import 'package:shimmer/shimmer.dart';

import '../../dataLayer/model/get_post_model.dart';
import '../constants/constants.dart';

class PostCardWidget extends StatefulWidget {
  final int index;

  final GetPostModel postModel;
  const PostCardWidget({
    super.key,
    required this.index,
    required this.postModel,
  });

  @override
  State<PostCardWidget> createState() => _PostCardWidgetState();
}

class _PostCardWidgetState extends State<PostCardWidget> {
  @override
  Widget build(BuildContext context) {
    final desize = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: UnconstrainedBox(
        child: Stack(
          children: [
            Container(
              height: desize.height * 3.5 / 10,
              width: desize.width * 9 / 10,
              decoration: BoxDecoration(
                borderRadius: Constants().BORDERCURVE,
                color: randomColor(widget.index),
              ),
            ),
            Align(
              alignment: Alignment.topRight,
              child: Padding(
                padding: EdgeInsets.only(left: desize.width * .3 / 10),
                child: TextSemiBold(
                  content: widget.postModel.userid!.name!,
                  color: Constants.COLOR_BLACK,
                  fontsize: 22,
                ),
              ),
            ),
            Positioned(
              top: desize.height * .4 / 10,
              left: desize.width * .3 / 10,
              child: Text(
                widget.postModel.caption!,
                style: const TextStyle(
                  color: Constants.COLOR_BLACK,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            Positioned(
              top: desize.height * .8 / 10,
              left: desize.width * .6 / 10,
              child: Center(
                // height: desize.height * 2 / 10,
                // width: desize.width * 5 / 10,
                child: ClipRRect(
                  borderRadius: Constants().BORDERCURVE,
                  child: CachedNetworkImage(
                    imageUrl: widget.postModel.image!,
                    height: desize.height * 2 / 10,
                    width: desize.width * 8 / 10,
                    fit: BoxFit.cover,
                    placeholder: (context, url) {
                      return Shimmer.fromColors(
                        period: const Duration(milliseconds: 2000),
                        baseColor: Constants.COLOR_GREYISH,
                        highlightColor: randomColor(widget.index),
                        child: const Icon(
                          Ionicons.image_outline,
                          size: 100,
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),
            Positioned(
              top: desize.height * 2.9 / 10,
              left: desize.width * .2 / 10,
              child: Row(
                children: [
                  LikeButton(id: widget.postModel.id!),
                  Constants.WIDTH10,
                  TextButton.icon(
                    style: TextButton.styleFrom(
                      foregroundColor: Constants.COLOR_BLACK,
                    ),
                    onPressed: () {},
                    icon: const Icon(Ionicons.chatbox_outline),
                    label: const Text("69 comments"),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Color randomColor(int index) {
    if (index % 3 == 0) {
      return Constants.COLOR_BLUE;
    } else if (index % 2 == 0) {
      return Constants.COLOR_ORANGISH;
    } else {
      return Constants.COLOR_PINKISH;
    }
  }
}

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
