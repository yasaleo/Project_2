import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../constants/constants.dart';

class ShimmerWidget extends StatelessWidget {
  const ShimmerWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: const [
          ShimmerCard(),
          Constants.HEIGHT10,
          ShimmerCard(),
          Constants.HEIGHT10,
          ShimmerCard(),
          Constants.HEIGHT10,
          ShimmerCard(),
          Constants.HEIGHT10,
          ShimmerCard(),
          Constants.HEIGHT10,
          ShimmerCard(),
          Constants.HEIGHT10,
        ],
      ),
    );
  }
}

class ShimmerCard extends StatelessWidget {
  const ShimmerCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final desize = MediaQuery.of(context).size;
    return Column(
      children: [
        Container(
          height: desize.height * 3.5 / 10,
          width: desize.width * 9 / 10,
          decoration: BoxDecoration(
            color: Constants.COLOR_GREYISH,
            borderRadius: Constants().BORDERCURVE,
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: ShimmerSkelton(
                    height: desize.height * .18 / 10,
                    width: desize.width * 4 / 10,
                  ),
                ),
                Constants.HEIGHT20,
                Align(
                  alignment: Alignment.topLeft,
                  child: ShimmerSkelton(
                    height: desize.height * .18 / 10,
                    width: desize.width * 6 / 10,
                  ),
                ),
                Constants.HEIGHT20,
                ShimmerSkelton(
                  height: desize.height * 1.8 / 10,
                  width: desize.width * 8.8 / 10,
                ),
                Constants.HEIGHT20,
                Row(
                  children: [
                    ShimmerSkelton(
                      height: desize.height * .18 / 10,
                      width: desize.width * 2 / 10,
                    ),
                    Constants.WIDTH20,
                    ShimmerSkelton(
                      height: desize.height * .18 / 10,
                      width: desize.width * 2 / 10,
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class ShimmerSkelton extends StatelessWidget {
  const ShimmerSkelton({
    Key? key,
    required this.height,
    required this.width,
  }) : super(key: key);

  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      period: const Duration(milliseconds: 2500),
      baseColor: Constants.COLOR_SEMIBLACK,
      highlightColor: Constants.COLOR_WHITE,
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          borderRadius: Constants().BORDERCURVE,
          color: Constants.COLOR_SEMIBLACK,
        ),
      ),
    );
  }
}
