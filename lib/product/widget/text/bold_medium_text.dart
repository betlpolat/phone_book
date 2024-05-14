import 'package:flutter/material.dart';
import 'package:phone_book/product/utility/constant/color_constant.dart';
import 'package:phone_book/product/utility/extension/context_extension.dart';

/// Project bold medium text with [TextTheme.bodyLarge] and  [FontWeight.bold]

class BoldMediumText extends StatelessWidget {
  const BoldMediumText({
    required this.text,
    this.textColor = ColorConstant.black,
    super.key,
  });

  /// Text title
  final String text;

  /// Text color
  final Color? textColor;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: context.textTheme.bodyLarge?.copyWith(
        color: textColor,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
