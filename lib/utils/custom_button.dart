import 'package:flutter/material.dart';
import 'package:dsw55388/utils/custom_colors.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final void Function()? onPressed;

  const CustomButton({
    super.key,
    required this.text,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 390,
      height: 50,
      margin: const EdgeInsets.symmetric(horizontal: 21),
      child: TextButton(
        style: TextButton.styleFrom(
          backgroundColor: CustomColors.lighterPurple,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15)
          )
        ),
        onPressed: onPressed,
        child: Text(
          text,
          style: const TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w700,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}