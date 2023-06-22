import 'package:flutter/material.dart';
import '../widgets/uppe_bar.dart';
import '../widgets/tile.dart';
class NotificationPage extends StatelessWidget {
   NotificationPage({super.key});
  final List<Map<String, dynamic>> _notifications = [
    {
      "title": "Updates Available",
      "description": "A new version is available. Please upgrade for the best experience.",
      "isnew" : true,
    },
    {
      "title": "Updates Available",
      "description": "A new version is available. Please upgrade for the best experience.",
      "isnew" : true,
    },
    {
      "title": "Updates Available",
      "description": "A new version is available. Please upgrade for the best experience.",
      "isnew" : false,
    },
    {
      "title": "Updates Available",
      "description": "A new version is available. Please upgrade for the best experience.",
      "isnew" : false,
    },
    {
      "title": "Updates Available",
      "description": "A new version is available. Please upgrade for the best experience.",
      "isnew" : false,
    },

  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromRGBO(237, 242, 247, 1),
        body: ListView(
          children: [
            const UpperBar(),
            const SizedBox(height: 20,),
            Column(
              children: <Widget>[
                for (var c in _notifications)
                  Container(
                      margin: const EdgeInsets.only(bottom: 10),
                      padding: const EdgeInsets.only(left: 16.0, right: 16.0),
                      child: CustomListTile(
                          header: c["title"],
                          description: c["description"],
                          isnew: c["isnew"],
                          ))
              ],
            
            )
          ],
        ),
      )
    ;
  }
}