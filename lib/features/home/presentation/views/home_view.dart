// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:h_l_s_application/features/home/presentation/views/Chatbot/chatbot_view.dart';
import 'package:h_l_s_application/features/home/presentation/views/Diary_view/diary_view.dart';
import 'package:h_l_s_application/features/home/presentation/views/Home_view/homepage.dart';
import 'package:h_l_s_application/features/home/presentation/views/widgets/custom_bottom_navigation_bar.dart';
import 'package:h_l_s_application/features/home/presentation/views/plans_views/plans_view.dart';
import 'package:h_l_s_application/features/home/presentation/views/profile_views/profile_page.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  _HomeView createState() => _HomeView();
}

class _HomeView extends State<HomeView> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    const Homepage(),
    const PlansView(),
    const ChatbotView(),
    const DiaryView(),
    const ProfilePage(),
  ];

  void onItemTapped(int index) {
    setState(
      () {
        _selectedIndex = index;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _selectedIndex,
        children: _pages,
      ),
      bottomNavigationBar: CustomBottomNavBar(
        currentIndex: _selectedIndex,
        onTap: onItemTapped,
      ),
    );
  }
}
