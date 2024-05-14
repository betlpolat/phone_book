import 'package:flutter/material.dart';
import 'package:phone_book/product/utility/constant/color_constant.dart';
import 'package:phone_book/product/widget/text/medium_text.dart';

/// Custom [TextButton] for project
class CustomTextButton extends StatelessWidget {
  const CustomTextButton({
    required this.onPressed,
    required this.text,
    required this.isButtonActive,
    super.key,
  });

  /// when user presses text button, this function works
  final VoidCallback onPressed;

  /// button text
  final String text;

  ///for button is active or not
  final bool isButtonActive;
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: _isButtonActive(),
      child: MediumText(
        text: text,
        textColor: _textColor(),
      ),
    );
  }

  VoidCallback? _isButtonActive() => isButtonActive ? onPressed : null;

  Color _textColor() => isButtonActive ? ColorConstant.blue : ColorConstant.grey;
}
