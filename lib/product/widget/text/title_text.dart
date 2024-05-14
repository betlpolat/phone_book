import 'package:flutter/material.dart';
import 'package:phone_book/product/utility/constant/color_constant.dart';
import 'package:phone_book/product/utility/extension/context_extension.dart';

/// Project normal text with [TextTheme.bodyLarge]

class TitleText extends StatelessWidget {
  const TitleText({
    required this.text,
    this.color = ColorConstant.black,
    super.key,
  });

  /// Text title
  final String text;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: context.textTheme.titleLarge?.copyWith(
        color: color,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
