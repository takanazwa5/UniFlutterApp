import 'package:flutter/material.dart';


class LandingView extends StatelessWidget {
  const LandingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset("assets/images/background.png"),
          Center(
            child: Image.asset(
              "assets/images/logo-no-background-large.png",
              width: 250,
              height: 250,
            ),
          )
        ]
      ),
    );
  }
}