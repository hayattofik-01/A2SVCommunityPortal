
import 'package:flutter/material.dart';

class CustomListTile extends StatelessWidget {
  final String header;
  final String description;
  final bool isnew;
  

  CustomListTile({
    required this.header,
    required this.description,
    required this.isnew,
  });


  @override
  Widget build(BuildContext context) {
    return Container(
      // margin: EdgeInsets.only(left: 16,right: 16),
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
            fontWeight: FontWeight.w600,
            fontSize: 16,
            color: Color.fromRGBO(0, 0, 0, 1),
            fontFamily: "Urbanist",
          ),
        ),
        subtitle: Container(
          padding: const EdgeInsets.only(top: 5, bottom: 0),
          child: Text(
            description,
            style: const TextStyle(
              color: Color.fromRGBO(74, 85, 104, 1),
              fontWeight: FontWeight.w500,
              fontSize: 14,
              fontFamily: "Urbanist",
              
            ),
          ),
        ),
        trailing: Container(
          width: 9.0,
          height: 9.0,
          margin: const EdgeInsets.only(left: 0, bottom: 35),
          decoration:  BoxDecoration(
            color: isnew ? const Color.fromRGBO(49, 130, 206, 1) : Colors.white,
            shape: BoxShape.circle,
          ),
        ),
      ),
    );
  }
}
