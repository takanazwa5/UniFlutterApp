import 'package:flutter/material.dart';
import 'package:dsw55388/utils/custom_colors.dart';


class CustomHeader extends StatelessWidget {
  final String title;

  const CustomHeader({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 19),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 30,
          fontWeight: FontWeight.w700,
          color: CustomColors.purple,
        ),
      ),
    );
  }
}