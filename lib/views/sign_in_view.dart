import 'package:flutter/material.dart';
import 'package:dsw55388/views/sign_up_view.dart';
import 'package:dsw55388/views/landing_view.dart';
import 'package:dsw55388/utils/custom_colors.dart';
import 'package:dsw55388/utils/custom_input_field.dart';
import 'package:dsw55388/utils/custom_header.dart';
import 'package:dsw55388/utils/custom_button.dart';


class SignInView extends StatelessWidget {
  const SignInView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          logo(),
          const SizedBox(height: 30),
          header(),
          const SizedBox(height: 50),
          signInField(),
          const SizedBox(height: 30),
          passwordField(),
          const SizedBox(height: 30),
          forgotPassword(),
          const SizedBox(height: 30),
          signInButton(context),
          const SizedBox(height: 220),
          signUpLabel(context)
        ],
      ),
    );
  }


  Row signUpLabel(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          "Don't have an account?",
          style: TextStyle(
            fontSize: 15,
            color: CustomColors.purple,
            fontWeight: FontWeight.w400,
          ),
        ),
        TextButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const SignUpView(),
              )
            );
          },
          child: const Text(
            "Sign up",
            style: TextStyle(
              fontSize: 15,
              color: CustomColors.purple,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
      ]);
  }


  CustomButton signInButton(BuildContext context) {
    return CustomButton(
      text: "Sign in",
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const LandingView(),
          )
        );
      },  
    );
  }


  Container forgotPassword() {
    return Container(
      margin: const EdgeInsets.only(right: 19),
      alignment: Alignment.centerRight,
      child: const Text(
        "Forgot Password?",
        style: TextStyle(
          fontSize: 15,
          color: CustomColors.purple,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }


  CustomInputField passwordField() {
    return const CustomInputField(
          labelText: "Password",
          obscureText: true,
          prefixIconPath: "assets/images/password_vector.png",
          suffixIconPath: "assets/images/eye_vector.png",
        );
  }


  CustomInputField signInField() {
    return const CustomInputField(
          labelText: "Email or User Name",
          prefixIconPath: "assets/images/login_vector.png",
        );
  }


  CustomHeader header() {
    return const CustomHeader(
      title: "Sign in",
    );
  }


  Container logo() {
    return Container(
      margin: const EdgeInsets.only(top: 62),
      alignment: Alignment.center,
      child: Image.asset(
        "assets/images/logo-no-background.png",
        width: 129,
        height: 129,
      ),
    );
  }
}
