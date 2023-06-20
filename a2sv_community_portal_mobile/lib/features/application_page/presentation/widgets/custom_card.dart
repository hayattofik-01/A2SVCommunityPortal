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
    return Container(
      width: 374,
      height: 123,
      margin: EdgeInsets.only(left: 27, top: 41, right: 27),
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
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                done
                    ? Icon(
                        Icons.check_circle,
                        color: Color(0xFF3182CE),
                      )
                    : Icon(Icons.radio_button_unchecked_rounded),
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
          ),
          SizedBox(height: 8),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
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
    );
  }
}
