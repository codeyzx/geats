import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class StatusBarWidget extends StatelessWidget {
  final Brightness brightness;
  final Widget child;

  const StatusBarWidget({
    super.key,
    this.brightness = Brightness.dark,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        statusBarIconBrightness: brightness,
        statusBarColor: Colors.transparent,
        systemNavigationBarIconBrightness: brightness,
        systemNavigationBarColor: Colors.transparent,
      ),
      child: child,
    );
  }
}
