import 'package:flutter/material.dart';
import 'package:zooom/resources/auth_methods.dart';
import 'package:zooom/screens/meeting_history_screen.dart';
import 'package:zooom/screens/meeting_screen.dart';
import 'package:zooom/utils/colors.dart';
import 'package:zooom/widgets/custom_button.dart';

import '../widgets/custom_animated_bottom_navigation.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;

  void onPageChanged(int value) {
    setState(() {
      _currentIndex = value;
    });
  }




  List<Widget> pages = [
    MeetingScreen(),
    const MeetingHistoryScreen(),
    const Text('Contacts'),
    CustomButton(text: 'Log out', onPressed: () => AuthMethods().signOut() )
  ];



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: bottomBar(),
      appBar: AppBar(
        elevation: 0,
        title: const Text(
          'Meet & Chat',
        ),
        centerTitle: true,
        backgroundColor: backgroundColor,
      ),
      body: pages[_currentIndex],
    );
  }

  Widget bottomBar() {
    Color _inactiveColor = Colors.grey;
    Color _activeColor = buttonColor;

    return CustomAnimatedBottomBar(
      containerHeight: 70,
      backgroundColor: backgroundColor,
      selectedIndex: _currentIndex,
      showElevation: true,
      itemCornerRadius: 24,
      curve: Curves.easeIn,
      onItemSelected: (index) => setState(() => _currentIndex = index),
      items: <BottomNavyBarItem>[
        BottomNavyBarItem(
          icon: const Icon(Icons.messenger_rounded),
          title: const Text('Meet & Chat'),
          activeColor: _activeColor,
          inactiveColor: _inactiveColor,
          textAlign: TextAlign.center,
        ),
        BottomNavyBarItem(
          icon: const Icon(Icons.message),
          title: const Text(
            'Meetings',
          ),
          activeColor: _activeColor,
          inactiveColor: _inactiveColor,
          textAlign: TextAlign.center,
        ),
        BottomNavyBarItem(
          icon: const Icon(Icons.people),
          title: const Text('Contacts'),
          activeColor: _activeColor,
          inactiveColor: _inactiveColor,
          textAlign: TextAlign.center,
        ),
        BottomNavyBarItem(
          icon: const Icon(Icons.settings),
          title: const Text('Settings'),
          activeColor: _activeColor,
          inactiveColor: _inactiveColor,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}

