import 'package:flutter/material.dart';
import 'package:h_l_s_application/constants.dart';

class CustomBottomNavBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  const CustomBottomNavBar(
      {super.key, required this.currentIndex, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
        top: 14,
      ),
      decoration: const BoxDecoration(
          boxShadow: [
            BoxShadow(
                color: Colors.grey,
                spreadRadius: 2,
                blurStyle: BlurStyle.outer,
                blurRadius: 10)
          ],
          color: kPrimaryColor,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          )),
      child: BottomNavigationBar(
        selectedFontSize: 12,
        elevation: 2,
        currentIndex: currentIndex,
        selectedItemColor: kSecondaryColor,
        unselectedItemColor: Colors.white54,
        backgroundColor: kPrimaryColor,
        type: BottomNavigationBarType.fixed,
        onTap: onTap,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.sticky_note_2_outlined),
            label: "Plans",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.face),
            label: "Chatbot",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.incomplete_circle),
            label: "Diary",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_3_outlined),
            label: "Profile",
          ),
        ],
      ),
    );
  }
}
