import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:shimmer/shimmer.dart';

import 'constants/constants.dart';

class CustomCachedImage extends StatelessWidget {
  const CustomCachedImage({
    Key? key,
    required this.imageUrl,
    required this.height,
    required this.width,
    required this.size,
  }) : super(key: key);
  final String imageUrl;
  final double height;
  final double width;
  final double size;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: imageUrl,
      height: height,
      width: width,
      fit: BoxFit.cover,
      placeholder: (context, url) {
        return Shimmer.fromColors(
          period: const Duration(milliseconds: 2000),
          baseColor: Constants.COLOR_GREYISH,
          highlightColor: Constants.COLOR_WHITE,
          child:  Icon(
            Ionicons.image_outline,
            size: size,
          ),
        );
      },
      errorWidget: (context, url, error) {
        return Shimmer.fromColors(
          period: const Duration(milliseconds: 2000),
          baseColor: Constants.COLOR_GREYISH,
          highlightColor: Constants.COLOR_WHITE,
          child:  Icon(
            Ionicons.image_outline,
            size: size,
          ),
        );
      },
    );
  }
}
