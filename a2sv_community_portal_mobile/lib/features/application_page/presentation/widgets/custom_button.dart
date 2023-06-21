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
      onTap: onTap,
      child: Container(
        width: screenWidth > 700 ? 124 : (124 / 428) * screenWidth,
        height: (48 / 1002) * screenHeight,
        decoration: BoxDecoration(
          color: Color(0xFF3182CE),
          borderRadius: BorderRadius.circular(6),
        ),
        child: Center(
          child: Text(
            label,
            style: TextStyle(
              fontFamily: 'Urbanist',
              fontStyle: FontStyle.normal,
              fontWeight: FontWeight.w600,
              color: Colors.white,
              fontSize: (18 / 1002) * screenHeight,
              height: 1.2, // equivalent to line-height: 24px
              letterSpacing: 0.02,
            ),
          ),
        ),
      ),
    );
  }
}
