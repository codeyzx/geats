import 'package:flutter/material.dart';

class ErrorPage extends StatelessWidget {
  final Exception? error;

  const ErrorPage({super.key, this.error});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(error != null ? error.toString() : 'Error'),
      ),
    );
  }
}
