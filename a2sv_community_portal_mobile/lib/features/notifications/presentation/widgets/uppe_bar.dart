import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class UpperBar extends StatelessWidget {
  const UpperBar({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return  Container(
              margin: const EdgeInsets.only(top: 15),
              height: 50,
              child: Stack(
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Container(
                      padding: const EdgeInsets.only(left: 17),
                      child: IconButton(
            icon: const Icon(Icons.arrow_back_ios_new_sharp),
            onPressed: () {
              // Add your menu button functionality here
              context.pop();
            },
          ),)
                        ),
                  const Align(
                    alignment: Alignment.center,
                    child: Text('Notifications',style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w600,
                      
                    ),))
                ],
              ),
            );
  }
}
