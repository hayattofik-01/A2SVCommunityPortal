import 'package:a2sv_community_portal_mobile/core/utils/colors.dart';
import 'package:a2sv_community_portal_mobile/features/announcement_page/presentation/page/announcement.dart';
import 'package:a2sv_community_portal_mobile/features/contest/presentation/pages/upcoming_and_recent_contest_page.dart';
import 'package:flutter/material.dart';

import '../../../../core/utils/media_query.dart';
import 'features/application_page/presentation/screen/home.dart';
import 'features/user_profile/presentation/screens/profile_page.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;

  static final List<Widget> _widgetOptions = <Widget>[
    const Home(),
    ContestPage(),
    AnnouncementPage(),
    const ProfilePage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _selectedIndex,
        children: _widgetOptions,
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home_max_outlined),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.code),
            label: 'Contest',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.announcement),
            label: 'Announcement',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
      ),
    );
  }
}