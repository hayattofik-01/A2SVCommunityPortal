import 'package:a2sv_community_portal_mobile/features/contest/presentation/pages/upcoming_and_recent_contest_page.dart';
import 'package:flutter/material.dart';

import 'features/application_page/presentation/screen/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ContestPage(),
      
    );
  }
}
