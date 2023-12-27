import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../widgets/onboarding.dart';

class OnboardingPage extends StatelessWidget {
  OnboardingPage({super.key});
  PageController _page = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(255, 255, 255, 1),
      body: Stack(
        children: [
          Container(
            alignment: const Alignment(0, 0.75),
            child: SmoothPageIndicator(
              controller: _page,
              count: 3,
              
            ),
          ),
          PageView(
            controller: _page,
            children: const [
              Onboarding(
                title: "Sign up",
                subtitle:
                    "Sign up to access contests and be eligible for applying to A2SV",
                image: "takecontests.png",
                islast: false,
              ),
              Onboarding(
                title: "Take Contests",
                subtitle: "Access contests and take at least 2 contests",
                image: "signup.png",
                islast: false,
              ),
              Onboarding(
                title: "Apply",
                subtitle: "Apply to join A2SV",
                image: "apply.png",
                islast: true,
              ),
            ],
          ),
          
        ],
      ),
    );
  }
}
