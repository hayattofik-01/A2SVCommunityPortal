import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  final String title;
  final String description;
  final bool done;
  const CustomCard(
      {Key? key,
      required this.title,
      required this.description,
      required this.done})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return Container(
      width: (300 / 428) * screenWidth,
      height: (150 / 1002) * screenHeight,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                done
                    ? Icon(Icons.done, color: Color(0xFF3182CE))
                    : Icon(Icons.radio_button_unchecked,
                        color: Color(0xFF3182CE)),
                SizedBox(width: 0.01 * ((374 / 428) * screenWidth)),
                Text(
                  title,
                  style: TextStyle(
                    fontSize: (20 / 1002) * screenHeight,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            SizedBox(height: 8.0),
            Text(
              description,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 0.02 * ((374 / 428) * screenWidth),
                color: Colors.grey,
              ),
            ),
          ],
        ),
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8.0),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 4.0,
            offset: Offset(0.0, 2.0),
          ),
        ],
      ),
    );
  }
}
