import 'package:floating_bottom_navigation_bar/floating_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:project_2/presentation/constants/constants.dart';
import 'package:project_2/presentation/screens/events/events_screen.dart';
import 'package:project_2/presentation/screens/profile/profile_screen.dart';
import 'package:project_2/presentation/screens/settings/settings_screen.dart';

import '../home/home_screen.dart';

class DefaultScreen extends StatefulWidget {
  const DefaultScreen({
    super.key,
  });

  @override
  State<DefaultScreen> createState() => _DefaultScreenState();
}

class _DefaultScreenState extends State<DefaultScreen> {
  int selectedindex = 0;
  @override
  Widget build(BuildContext context) {
    // final desize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Constants.COLOR_BLACK,
      body: buildBody(),
      extendBody: true,
      bottomNavigationBar: FloatingNavbar(
        onTap: ontap,
        currentIndex: selectedindex,
        items: [
          FloatingNavbarItem(icon: Icons.home, title: 'Home'),
          FloatingNavbarItem(icon: Ionicons.notifications, title: 'events'),
          FloatingNavbarItem(icon: Icons.chat_bubble_outline, title: 'Chats'),
          FloatingNavbarItem(icon: Icons.person, title: 'Profile'),
        ],
      ),
    );
  }

  Widget buildBody() {
    switch (selectedindex) {
      case 1:
        return const EventsScreen();
      case 2:
        return const SettingScreeen();
      case 3:
        return  ProfileScreen();

      case 0:
      default:
        return const HomeScreen();
    }
  }

  ontap(int index) {
    setState(() {
      selectedindex = index;
    });
  }
}
