import 'package:flutter/material.dart';
import 'package:phone_book/product/utility/constant/color_constant.dart';
import 'package:phone_book/product/utility/extension/context_extension.dart';

class NormalTextButton extends StatelessWidget {
  const NormalTextButton({
    required this.onPressed,
    required this.title,
    super.key,
    this.color = ColorConstant.black,
  });
  final VoidCallback onPressed;
  final String title;
  final Color? color;
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Text(
        title,
        style: context.textTheme.bodyLarge?.copyWith(
          color: color,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
