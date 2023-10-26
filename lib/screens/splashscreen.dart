import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SPLASH Screen'),
      ),
      body: Container(
        child: Text('Loading...'),
      ),
    );
  }
}
