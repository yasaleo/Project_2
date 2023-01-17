import 'package:custom_refresh_indicator/custom_refresh_indicator.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:project_2/data_layer/repositeries/repositories.dart';
import 'package:project_2/presentation/widgets/constants/constants.dart';
import 'package:project_2/presentation/main_screens/add_post/add_post.dart';
import 'package:project_2/presentation/widgets/post_card_widget.dart';
import 'package:rive/rive.dart';
import '../../../data_layer/model/get_post_model.dart';
import '../../widgets/shimmer_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<GetPostModel> postLists = [];
  final double offsetTArmed = 220;
  @override
  Widget build(BuildContext context) {
    // final desize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Constants.COLOR_SCAFFOLD_BACKGROUND,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Constants.COLOR_BLACK,
        title: const Text(
          "Home ",
          style: TextStyle(
            color: Constants.COLOR_WHITE,
          ),
        ),
        actions: [
          TextButton.icon(
            style: TextButton.styleFrom(
              foregroundColor: Constants.COLOR_WHITE,
            ),
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const AddPost(),
                ),
              );
            },
            icon: const Icon(Ionicons.add_circle_outline),
            label: const Text("Post"),
          )
        ],
      ),
      body: customRefresh(),
    );
  }

  CustomRefreshIndicator customRefresh() {
    return CustomRefreshIndicator(
      leadingScrollIndicatorVisible: true,
      onRefresh: refresh,
      builder: (context, child, controller) => AnimatedBuilder(
        animation: controller,
        child: child,
        builder: (context, child) {
          return Padding(
            padding: const EdgeInsets.all(3),
            child: Stack(
              children: <Widget>[
                Container(
                  padding: const EdgeInsets.symmetric(
                    vertical: 8,
                  ),
                  decoration: const BoxDecoration(
                    color: Constants.COLOR_BLACK,
                  ),
                  width: double.infinity,
                  height: offsetTArmed * controller.value,
                  child: ClipRRect(
                    borderRadius: Constants().BORDERCURVE,
                    child: const RiveAnimation.asset(
                      'assets/pull-to-refresh.riv',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Center(
                  child: Transform.translate(
                    offset: Offset(
                      0.0,
                      offsetTArmed * controller.value,
                    ),
                    child: child,
                  ),
                )
              ],
            ),
          );
        },
      ),
      offsetToArmed: offsetTArmed,
      child: postView(),
    );
  }

  Future refresh() async {
    final posts = await Repositories().getAllUserPost();
    setState(() {
      postLists = posts;
    });
  }

  FutureBuilder<List<GetPostModel>> postView() {
    return FutureBuilder(
      future: Repositories().getAllUserPost(),
      builder: (context, AsyncSnapshot<List<GetPostModel>> snapshot) {
        if (snapshot.data == null) {
          return const ShimmerWidget();
        } else if (snapshot.connectionState == ConnectionState.waiting) {
          return const ShimmerWidget();
        } else if (snapshot.connectionState == ConnectionState.done &&
            snapshot.hasData) {
          return ListView.builder(
            itemBuilder: (context, index) {
              postLists = snapshot.requireData;
              final postDetails = postLists[index];
              return PostCardWidget(
                index: index,
                postModel: postDetails,
              );
            },
            itemCount: snapshot.data!.length,
          );
        }  else {
          return const CircularProgressIndicator(
            color: Constants.COLOR_WHITE,
            strokeWidth: 4,
          );
        }
      },
    );
  }
}
