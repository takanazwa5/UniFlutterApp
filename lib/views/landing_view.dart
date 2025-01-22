import 'package:dsw55388/views/sign_in_view.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';


class LandingView extends StatelessWidget {
  const LandingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset("assets/images/background.png"),
          TextButton(
            onPressed: () async {
              final SharedPreferences prefs = await SharedPreferences.getInstance();
              await prefs.setBool("isLoggedIn", false);
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const SignInView()),
              );
            },
            child: Container(
              margin: const EdgeInsets.only(top: 30.0, left: 20.0),
              child: const Text(
                "Log out",
                style: TextStyle(fontSize: 20.0),
              ),
            ),
          )
        ]
      ),
    );
  }
}