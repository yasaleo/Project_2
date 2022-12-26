import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:project_2/presentation/constants/constants.dart';
import 'package:project_2/presentation/screens/add_post/add_post.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
              label: const Text("Post"))
        ],
      ),
      body: Center(
        child: ListView.separated(
          itemBuilder: (context, index) {
            return Container(
              height: 200,
              width: 200,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(
                      "http://res.cloudinary.com/dyhk7g1gq/image/upload/v1671544368/t2lpmmuvjowmpwtvzduj.png"),
                ),
                color: Constants.COLOR_GREENISH,
              ),
            );
          },
          itemCount: 20,
          separatorBuilder: (BuildContext context, int index) {
            return const Divider();
          },
        ),
      ),
    );
  }
}
