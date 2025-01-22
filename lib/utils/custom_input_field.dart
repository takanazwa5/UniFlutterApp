import 'package:flutter/material.dart';
import 'package:dsw55388/utils/custom_colors.dart';


class CustomInputField extends StatelessWidget {
  final String labelText;
  final String prefixIconPath;
  final String? suffixIconPath;
  final bool obscureText;
  final TextEditingController controller;

  const CustomInputField({
    super.key,
    required this.labelText,
    required this.prefixIconPath,
    this.suffixIconPath,
    this.obscureText = false,
    required this.controller,
  });


  @override
  Widget build(BuildContext context) {
    const myBorder = OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(15)),
      borderSide: BorderSide(
        color: CustomColors.lightPurple,
        width: 2,
      ),
    );
    return Container(
      width: 390,
      height: 50,
      margin: const EdgeInsets.symmetric(horizontal: 21),
      child: TextFormField(
        controller: controller,
        obscureText: obscureText,
        decoration: InputDecoration(
          labelText: labelText,
          enabledBorder: myBorder,
          focusedBorder: myBorder,
          prefixIcon: Image.asset(
            prefixIconPath,
            width: 30,
            height: 30,
          ),
          suffixIcon: suffixIconPath != null
              ? Image.asset(
            suffixIconPath!,
            width: 20,
            height: 20,
          )
              : null,
        ),
      ),
    );
  }
}
