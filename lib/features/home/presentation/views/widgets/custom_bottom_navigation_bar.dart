import 'package:flutter/material.dart';
import 'package:h_l_s_application/constants.dart';

class CustomBottomNavBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  const CustomBottomNavBar(
      {super.key, required this.currentIndex, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        splashFactory: NoSplash.splashFactory,
      ),
      child: Container(
        padding: const EdgeInsets.only(
          top: 12,
        ),
        decoration: const BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.grey,
                blurStyle: BlurStyle.normal,
                blurRadius: 12,
              ),
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
          unselectedItemColor: Colors.white,
          backgroundColor: kPrimaryColor,
          type: BottomNavigationBarType.fixed,
          onTap: onTap,
          items: const [
            BottomNavigationBarItem(
              icon: ImageIcon(
                AssetImage('assets/Images/home.png'),
                size: 24,
              ),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: ImageIcon(
                AssetImage('assets/Images/plans.png'),
                size: 24,
              ),
              label: 'Plans',
            ),
            BottomNavigationBarItem(
              icon: ImageIcon(
                AssetImage('assets/Images/chatbot.png'),
                size: 24,
              ),
              label: 'Chatbot',
            ),
            BottomNavigationBarItem(
              icon: ImageIcon(
                AssetImage('assets/Images/diary.png'),
                size: 24,
              ),
              label: 'Diary',
            ),
            BottomNavigationBarItem(
              icon: ImageIcon(
                AssetImage('assets/Images/profile.png'),
                size: 24,
              ),
              label: 'Profile',
            ),
          ],
        ),
      ),
    );
  }
}
