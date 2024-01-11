import 'package:flutter/material.dart';
import 'package:geats/src/constants/constants.dart';

class PaddingWidget extends StatelessWidget {
  final Widget child;
  const PaddingWidget({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: SizeApp.w24,
      ),
      child: child,
    );
  }
}
