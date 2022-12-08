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
    final desize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Constants.COLOR_BLACK,
      body: buildBody(),
      bottomNavigationBar: NavigationBar(
        
        destinations: const [
          NavigationDestination(
            icon: Icon(
              Ionicons.home,
            ),
            label: "Home",
          ),
          NavigationDestination(
            icon: Icon(Ionicons.settings),
            label: "settings",
          ),NavigationDestination(
            icon: Icon(
              Ionicons.person,
            ),
            label: "profile",
          ),
          NavigationDestination(
            icon: Icon(
              Ionicons.menu,
            ),
            label: "event",
          ),
        ],
          onDestinationSelected: ontap,
          selectedIndex: selectedindex,
          labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
      ),
    );
  }

  Widget buildBody() {
    switch (selectedindex) {
      case 1:
        return const SettingScreeen();
      case 2:
        return const ProfileScreen();
      case 3:
        return const EventsScreen();

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
