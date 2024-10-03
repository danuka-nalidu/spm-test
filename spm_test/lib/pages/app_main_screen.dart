import 'package:flutter/material.dart';
import 'package:flutter_firebase_project/pages/community_page.dart';
import 'package:flutter_firebase_project/pages/home_screen.dart';
import 'package:iconsax/iconsax.dart';

const kprimaryColor = Color.fromARGB(255, 90, 11, 168);

class AppMainScreen extends StatefulWidget {
  const AppMainScreen({super.key});

  @override
  State<AppMainScreen> createState() => _AppMainScreenState();
}

class _AppMainScreenState extends State<AppMainScreen> {
  int selectedIndex = 0;
  late final List<Widget> page;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              blurRadius: 10,
              spreadRadius: 2,
              offset: const Offset(0, -2),
            ),
          ],
        ),
        child: BottomNavigationBar(
          backgroundColor: Colors.white,
          elevation: 0,
          iconSize: 28,
          currentIndex: selectedIndex,
          selectedItemColor: kprimaryColor,
          unselectedItemColor: Colors.grey[600], // Darker unselected icons
          type: BottomNavigationBarType.fixed,
          selectedLabelStyle: const TextStyle(
            color: kprimaryColor,
            fontWeight: FontWeight.w600,
            fontSize: 14,
          ),
          unselectedLabelStyle: const TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w500,
          ),
          onTap: (value) {
            setState(() {
              selectedIndex = value;
            });
          },
          items: [
            BottomNavigationBarItem(
              icon: Icon(
                selectedIndex == 0 ? Iconsax.home5 : Iconsax.home,
                color: selectedIndex == 0 ? kprimaryColor : Colors.grey[600],
              ),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                selectedIndex == 1 ? Iconsax.camera5 : Iconsax.camera,
                color: selectedIndex == 1 ? kprimaryColor : Colors.grey[600],
              ),
              label: 'Object',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                selectedIndex == 2
                    ? Iconsax.profile_2user5
                    : Iconsax.profile_2user,
                color: selectedIndex == 2 ? kprimaryColor : Colors.grey[600],
              ),
              label: 'Community',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                selectedIndex == 3 ? Iconsax.video5 : Iconsax.video,
                color: selectedIndex == 3 ? kprimaryColor : Colors.grey[600],
              ),
              label: 'Video',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                selectedIndex == 4
                    ? Iconsax.notification5
                    : Iconsax.notification,
                color: selectedIndex == 4 ? kprimaryColor : Colors.grey[600],
              ),
              label: 'Notification',
            ),
          ],
        ),
      ),
      body: _buildPage(selectedIndex),
    );
  }

  //Screen Navigation logic
  Widget _buildPage(int index) {
    switch (index) {
      case 0:
        return HomeScreen();
      case 1:
        return navbarPage(Iconsax.camera5); //Object identification
      case 2:
        return Home(); //Community collaboration
      case 3:
        return navbarPage(Iconsax.video5);
      case 4:
        return navbarPage(Iconsax.notification5);
      default:
        return navbarPage(Iconsax.home5);
    }
  }

  Widget navbarPage(IconData iconName) {
    return Center(
      child: Icon(
        iconName,
        size: 100,
        color: kprimaryColor,
      ),
    );
  }
}
