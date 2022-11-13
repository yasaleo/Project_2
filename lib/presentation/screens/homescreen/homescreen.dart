import 'package:flutter/material.dart';
import 'package:project_2/presentation/screens/secondscreen/second_screen.dart';
import 'package:rive/rive.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text(
          "Home Screen",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        centerTitle: true,
      ),
      body: const Center(
        child: RiveAnimation.asset(
          "assets/3287-6917-headless-bear.riv",
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.next_plan_outlined),
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => const SecondScreeen(),
          ));
        },
      ),
    );
  }
}
