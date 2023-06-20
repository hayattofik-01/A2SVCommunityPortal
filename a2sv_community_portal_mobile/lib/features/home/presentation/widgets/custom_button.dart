import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String label;
  final VoidCallback? onTap;

  const CustomButton({
    Key? key,
    required this.label,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return GestureDetector(
      child: Container(
        width: (100 / 375) * screenWidth,
        height: (100 / 1002) * screenHeight,
        decoration: BoxDecoration(
          color: Color(0xFF3182CE),
          borderRadius: BorderRadius.circular(25),
        ),
        child: Center(
          child: Text(
            label,
            style: TextStyle(
              fontFamily: 'Urbanist',
              fontStyle: FontStyle.normal,
              fontWeight: FontWeight.w600,
              fontSize: (10 / 375) * screenWidth,
              height: 1.2, // equivalent to line-height: 24px
              letterSpacing: 0.02,
            ),
          ),
        ),
      ),
    );
  }
}
