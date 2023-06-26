import 'package:a2sv_community_portal_mobile/features/notifications/presentation/widgets/uppe_bar.dart';
import 'package:flutter/material.dart';

class DetailsPage extends StatelessWidget {
  const DetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    const String title =
        "Would you like your idea to be implemented by some of the best engineers of Africa and win \$200?";
    const String body =
        '''If you want to be part of this pivotal stage in our education program, where innovation meets societal impact, please fill out this form 📝📋, which is designed to learn about project ideas aimed at addressing community problems. 🤔🌱
Your project idea should identify a specific community problem and present a viable solution 💡🤝, focusing on the positive change it can bring. While the primary objective should not be revenue generation, we do appreciate ideas that can sustain themselves financially 💰💪, as this is indicative of their long-term feasibility and success.
Remember, every idea counts and every project starts with a spark of creativity. 🔥🌈 We encourage you to think big, be innovative, and most importantly, demonstrate how your project could make our community a better place. 🌟✨ We can't wait to see the unique and impactful ideas that you, our A2SVians, will bring to the table. 🙌💡
Please share this form with anyone you think has a great idea. Don\'t forget, the right ideas will fly. 🚀🌟

''';

    return const MaterialApp(
      home: DetailScreen(title: title, body: body),
    );
  }
}

class DetailScreen extends StatelessWidget {
  const DetailScreen({super.key, required this.title, required this.body});
  final String title;
  final String body;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          const UpperBar(
            title: '',
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 36.0),
            child: Text(
              title,
              style: const TextStyle(
                fontFamily: "Popins",
                height: 1.5,
                fontSize: 20,
                fontWeight: FontWeight.w900,
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 36.0),
            child: Text(
              body,
              style: const TextStyle(
                color: Color(0xFF000000),
                fontFamily: 'Inter',
                height: 1.5,
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
