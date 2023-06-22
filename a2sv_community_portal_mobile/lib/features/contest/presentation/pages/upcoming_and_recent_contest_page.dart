import 'package:a2sv_community_portal_mobile/core/utils/widgets/bottom_bar.dart';
import 'package:a2sv_community_portal_mobile/core/utils/widgets/upper_bar.dart';
import 'package:a2sv_community_portal_mobile/features/contest/presentation/widgets/list_tile.dart';
import 'package:flutter/material.dart';

class ContestPage extends StatelessWidget {
  final List<Map<String, String>> _contests = [
    {
      "title": "OnBoarding Contest #2 Div-1 ",
      "date": "June 18,2023",
      "time": "9:00pm EAT"
    },
    {
      "title": "OnBoarding Contest #2 Div-1 ",
      "date": "June 18,2023",
      "time": "9:00pm EAT"
    },
    {
      "title": "OnBoarding Contest #2 Div-1 ",
      "date": "June 18,2023",
      "time": "9:00pm EAT"
    },
  ];

  ContestPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const UpperBar(),
      body: ListView(
        children: [
          const SizedBox(height: 26),
          Container(
              padding: const EdgeInsets.only(left: 16.0, right: 16.0),
              child: const Text('Upcoming Contests',
                  style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w600,
                      color: Color.fromRGBO(0, 0, 0, 0.92)))),
          const SizedBox(height: 26),
          Column(
            children: <Widget>[
              for (var c in _contests)
                Container(
                    margin: const EdgeInsets.only(bottom: 10),
                    padding: const EdgeInsets.only(left: 16.0, right: 16.0),
                    child: CustomListTile(
                        header: c["title"]!,
                        date: c["date"]!,
                        time: c["time"]!))
            ],
          ),
          Container(
              padding: const EdgeInsets.only(
                  left: 16.0, right: 16.0, top: 16, bottom: 16),
              child: const Text('Recent Contests',
                  style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w600,
                      color: Color.fromRGBO(0, 0, 0, 0.92)))),
          Column(
            children: <Widget>[
              for (var c in _contests)
                Container(
                    margin: const EdgeInsets.only(bottom: 10),
                    padding: const EdgeInsets.only(left: 16.0, right: 16.0),
                    child: CustomListTile(
                        header: c["title"]!,
                        date: c["date"]!,
                        time: c["time"]!))
            ],
          ),
          const SizedBox(
            height: 50,
          )
        ],
      ),
      bottomNavigationBar: const MainBottomNavigationBar(),
    );
  }
}
