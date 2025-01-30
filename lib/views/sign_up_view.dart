import 'package:flutter/material.dart';
import 'package:dsw55388/utils/custom_colors.dart';
import 'package:dsw55388/utils/custom_button.dart';
import 'package:dsw55388/utils/custom_header.dart';
import 'package:dsw55388/utils/custom_input_field.dart';

class SignUpView extends StatefulWidget {
  const SignUpView({super.key});

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Stack(
            children: [
              ellipse(),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 80),
                  backButton(context),
                  const SizedBox(height: 80),
                  header(),
                  const SizedBox(height: 50),
                  nameField(nameController),
                  const SizedBox(height: 30),
                  emailField(emailController),
                  const SizedBox(height: 30),
                  passwordField(passwordController),
                  const SizedBox(height: 30),
                  confirmPasswordField(confirmPasswordController),
                  const SizedBox(height: 80),
                  signUpButton(),
                  const SizedBox(height: 105),
                  signInLabel(context)
                ],
              ),
            ],
          ),
        )
      ),
    );
  }

  Container ellipse() {
    return Container(
      alignment: Alignment.topRight,
      child: Image.asset("assets/images/ellipse.png"),
    );
  }

  Container backButton(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 12),
      child: GestureDetector(
        onTap: () {
          Navigator.pop(context);
        },
        child: Row(
          children: [
            Image.asset(
              "assets/images/back_vector.png",
              width: 20,
              height: 20,
            ),
            const Text(
              "Back",
              style: TextStyle(
                fontSize: 12,
                color: CustomColors.purple,
                fontWeight: FontWeight.w400,
              ),
            )
          ],
        ),
      ),
    );
  }

  CustomHeader header() {
    return const CustomHeader(
      title: "Sign up",
    );
  }

  CustomInputField nameField(TextEditingController controller) {
    return CustomInputField(
      labelText: "Full Name",
      prefixIconPath: "assets/images/login_vector.png",
      controller: controller,
    );
  }

  CustomInputField emailField(TextEditingController controller) {
    return CustomInputField(
      labelText: "Email",
      prefixIconPath: "assets/images/email_vector.png",
      controller: controller,
    );
  }

  CustomInputField passwordField(TextEditingController controller) {
    return CustomInputField(
      labelText: "Password",
      obscureText: true,
      prefixIconPath: "assets/images/password_vector.png",
      suffixIconPath: "assets/images/eye_vector.png",
      controller: controller,
    );
  }

  CustomInputField confirmPasswordField(TextEditingController controller) {
    return CustomInputField(
      labelText: "Confirm Password",
      obscureText: true,
      prefixIconPath: "assets/images/password_vector.png",
      suffixIconPath: "assets/images/eye_vector.png",
      controller: controller,
    );
  }

  CustomButton signUpButton() {
    return const CustomButton(
      text: "Sign up",
    );
  }

  Row signInLabel(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          "Already have an account?",
          style: TextStyle(
            fontSize: 15,
            color: CustomColors.purple,
            fontWeight: FontWeight.w400,
          ),
        ),
        TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text(
            "Sign in",
            style: TextStyle(
              fontSize: 15,
              color: CustomColors.purple,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
      ]);
  }
}