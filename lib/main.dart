import 'package:dsw55388/views/landing_view.dart';
import 'package:dsw55388/views/sign_in_view.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final SharedPreferences prefs = await SharedPreferences.getInstance(); // Will build forever without this.
  runApp(MyApp(isLoggedIn: prefs.getBool("isLoggedIn") ?? false));
}

class MyApp extends StatelessWidget {
  final bool isLoggedIn;
  const MyApp({super.key, required this.isLoggedIn});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: "Inter",
      ),
      home: isLoggedIn ? const LandingView() : const SignInView()
    );
  }
}