import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class Onboarding extends StatelessWidget {
  final String title;
  final String subtitle;
  final String image;
  final bool islast;

  const Onboarding(
      {super.key,
      required this.title,
      required this.subtitle,
      required this.image,
      required this.islast});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: islast
          ? const EdgeInsets.only(bottom: 0)
          : const EdgeInsets.only(bottom: 150),
      color: const Color.fromRGBO(255, 255, 255, 1),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              children: [
                Container(
                    margin: const EdgeInsets.all(20),
                    child: Image.asset(
                      'assets/svg/$image',
                    )),
                Container(
                    margin: const EdgeInsets.all(20),
                    child: Text(
                      title,
                      style: const TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 24,
                      ),
                    )),
                Container(
                    padding:
                        const EdgeInsets.only(top: 20, left: 30, right: 30),
                    child: Center(
                      child: Text(
                        subtitle,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                          color: Color.fromRGBO(164, 164, 164, 1),
                        ),
                      ),
                    )),
              ],
            ),
            islast
                ? Container(
                    height: 60,
                    width: double.infinity,
                    margin:
                        const EdgeInsets.only(left: 37.0, right: 37.0, top: 36),
                    child: ElevatedButton(
                      onPressed: () {
                        GoRouter.of(context).go('/login');
                      },
                      child: const Text("Get Started"),
                    ),
                  )
                : Container(),
          ],
        ),
      ),
    );
  }
}
