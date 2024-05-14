import 'package:flutter/material.dart';

import 'package:phone_book/product/utility/constant/color_constant.dart';
import 'package:phone_book/product/utility/extension/context_extension.dart';

/// Project medium text with [TextTheme.bodyLarge]

class MediumText extends StatelessWidget {
  const MediumText({
    required this.text,
    super.key,
    this.textColor = ColorConstant.black,
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
        fontWeight: FontWeight.w500,
      ),
    );
  }
}
