import 'dart:math';

import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  final String title;
  final String description;
  final bool done;

  const CustomCard({
    Key? key,
    required this.title,
    required this.description,
    required this.done,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    double horPadding = (15 / 428) * screenWidth;
    return Container(
      width: screenWidth >= 600 ? (200 / 428) * screenWidth : null,
      margin: EdgeInsets.only(
          left: (27 / 418) * screenWidth,
          top: (41 / 1002) * screenHeight,
          right: (27 / 418) * screenWidth),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Color.fromRGBO(0, 0, 0, 0.06),
            blurRadius: 2,
            offset: Offset(0, 1),
          ),
          BoxShadow(
            color: Color.fromRGBO(0, 0, 0, 0.1),
            blurRadius: 3,
            offset: Offset(0, 1),
          ),
        ],
      ),
      child: Padding(
        padding: EdgeInsets.all(horPadding),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                done
                    ? Icon(
                        Icons.check_circle,
                        color: Color(0xFF3182CE),
                      )
                    : Icon(
                        Icons.radio_button_unchecked_rounded,
                        color: Color(0xFF3182CE),
                      ),
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Text(
                description,
                style: TextStyle(
                  fontSize: 14,
                  color: Color.fromRGBO(0, 0, 0, 0.326),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
