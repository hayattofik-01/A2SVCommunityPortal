import 'package:flutter/material.dart';

class CustomListTile extends StatelessWidget {
  final String header;
  final String date;
  final String time;

  const CustomListTile({
    super.key,
    required this.header,
    required this.date,
    required this.time,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(7),
      decoration: BoxDecoration(
        border: const Border(
            top: BorderSide(color: Color.fromRGBO(0, 0, 0, 0.08)),
            bottom: BorderSide(color: Color.fromRGBO(0, 0, 0, 0.08)),
            left: BorderSide(color: Color.fromRGBO(0, 0, 0, 0.08)),
            right: BorderSide(color: Color.fromRGBO(0, 0, 0, 0.08))),
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: ListTile(
        title: Text(
          header,
          style: const TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 16,
            color: Color.fromRGBO(0, 0, 0, 1),
          ),
        ),
        subtitle: Container(
          padding: const EdgeInsets.only(top: 5, bottom: 0),
          child: Text(
            '$date  $time',
            style: const TextStyle(
              color: Color.fromRGBO(0, 0, 0, 0.24),
              fontWeight: FontWeight.w500,
              fontSize: 12,
            ),
          ),
        ),
      ),
    );
  }
}
