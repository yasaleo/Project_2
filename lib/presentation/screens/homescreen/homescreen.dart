import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:project_2/presentation/constants/constants.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    super.key,
  });

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedindex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Constants.COLOR_BLACK,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.black,
        title: const Text(
          "Home Screen",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w900,
          ),
        ),
      ),
      body: const Center(),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20, bottom: 10),
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(color: Constants.COLOR_WHITE, width: 2),
            borderRadius: BorderRadius.circular(25),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(25),
            child: BottomNavigationBar(
              showSelectedLabels: false,
              showUnselectedLabels: false,
              selectedItemColor: Constants.COLOR_WHITE,
              unselectedItemColor: Constants.COLOR_WHITE,
       
              selectedIconTheme: const IconThemeData(
                color: Constants.COLOR_BLACK,
              ),
              backgroundColor: Constants.COLOR_BLACK,
              currentIndex: selectedindex,
              onTap: ontap,
              items:<BottomNavigationBarItem> [
                BottomNavigationBarItem(
                  icon: navbaricon(
                    index: 0,
                    icon: Ionicons.home,
                  ),
                  label: 'Home',
                ),
                BottomNavigationBarItem(
                  icon: navbaricon(
                    index: 1,
                    icon: Ionicons.settings,
                  ),
                  label: "Settings",
                ),
                BottomNavigationBarItem(
                  icon: navbaricon(
                    index: 2,
                    icon: Ionicons.person,
                  ),
                  label: "Account",
                ),
                // BottomNavigationBarItem(icon: navbaricon(index: 3, icon: Ionicons.accessibility),label: "asss")
                
              ],
            ),
          ),
        ),
      ),
    );
  }

  AnimatedContainer navbaricon({required int index, required IconData icon}) {
    return AnimatedContainer(
      height: 35,
      width: 65,
      duration: const Duration(milliseconds: 500),
      decoration: BoxDecoration(
          color: selectedindex == index
              ? Constants.COLOR_WHITE
              : Constants.COLOR_BLACK,
          borderRadius: BorderRadius.circular(15)),
      child: Icon(
        icon,
      ),
    );
  }

  ontap(int index) {
    setState(() {
      selectedindex = index;
    });
  }
}
