import 'package:a2sv_community_portal_mobile/core/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';

class CustomListTile extends StatelessWidget {
  final String header;
  final String description;
  final String type;
  final bool isRead;

  const CustomListTile({
    Key? key,
    required this.header,
    required this.description,
    required this.type,
    required this.isRead,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(7),
      decoration: BoxDecoration(
        border: Border.all(color: const Color.fromRGBO(0, 0, 0, 0.08)),
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: GestureDetector(
        onTap: () {
          showDialog(
            context: context,
            builder: (context) => AlertDialog(
              title: Text(header),
              content: SingleChildScrollView(
                child: Container(
                  padding: const EdgeInsets.all(16.0),
                  child: MarkdownBody(
                    data: description,
                  ),
                ),
              ),
              actions: [
                TextButton(
                  child: const Text('Close'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            ),
          );
        },
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
          trailing: Container(
            width: 9.0,
            height: 9.0,
            margin: const EdgeInsets.only(left: 0, bottom: 35),
            decoration: BoxDecoration(
              color:
                  isRead ? backgroundWhite : const Color.fromRGBO(49, 130, 206, 1),
              shape: BoxShape.circle,
            ),
          ),
        ),
      ),
    );
  }
}
