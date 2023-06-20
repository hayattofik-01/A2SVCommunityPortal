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
    return Card(
      clipBehavior: Clip.antiAlias,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          ListTile(
            leading: done
                ? Icon(Icons.done, color: Color(0xFF3182CE))
                : Icon(Icons.radio_button_unchecked, color: Color(0xFF3182CE)),
            title: Text(title),
            subtitle: done
                ? Text(
                    'Done',
                    style: TextStyle(color: Colors.black.withOpacity(0.6)),
                  )
                : Text(
                    'To be done',
                    style: TextStyle(color: Colors.black.withOpacity(0.6)),
                  ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'Greyhound divisively hello coldly wonderfully marginally far upon excluding.',
              style: TextStyle(color: Colors.black.withOpacity(0.6)),
            ),
          ),
        ],
      ),
    );
  }
}
