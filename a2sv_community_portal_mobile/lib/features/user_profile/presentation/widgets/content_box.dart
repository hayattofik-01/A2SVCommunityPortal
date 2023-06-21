import 'package:flutter/material.dart';

import '../../../../core/utils/media_query.dart';

class ContentBox extends StatelessWidget {
  const ContentBox({
    super.key,
    required this.boxHeight,
    required this.child,
  });
  final double boxHeight;
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(
            vertical: UIConverter.getComponentHeight(context, 8),
            horizontal: 16),
        child: Container(
            height: UIConverter.getComponentHeight(context, boxHeight),
            decoration: BoxDecoration(
              border: Border.all(
                color: const Color.fromRGBO(0, 0, 0, 0.08),
                width: 1,
              ),
              borderRadius: const BorderRadius.all(Radius.circular(10)),
            ),
            child: child));
  }
}
