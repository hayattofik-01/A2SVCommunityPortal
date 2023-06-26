import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';


class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        backgroundColor: Color.fromRGBO(49, 130, 206, 1),
        body: Center(
          child: SvgPicture.asset(
            'assets/svg/splash.svg',
            width: 232,
            height: 117,
          ),
        ),
      );
  }
}