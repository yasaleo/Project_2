import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:project_2/data_layer/model/get_comment.dart';
import 'package:project_2/data_layer/repositeries/repositories.dart';
import 'package:project_2/presentation/widgets/custom_cached_image.dart';
import 'package:project_2/presentation/widgets/text_widgets.dart';
import 'package:shimmer/shimmer.dart';

import '../../data_layer/model/get_post_model.dart';
import 'constants/constants.dart';
import '../main_screens/add_post/comment_post.dart';
import 'like_button.dart';

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
                  CommentButton(
                    id: widget.postModel.id!,
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


