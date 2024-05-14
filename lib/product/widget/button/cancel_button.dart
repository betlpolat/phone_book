import 'package:flutter/material.dart';
import 'package:phone_book/product/init/language/locale_keys.g.dart';
import 'package:phone_book/product/utility/extension/string_extension.dart';
import 'package:phone_book/product/widget/button/custom_text_button.dart';

class CancelButton extends StatelessWidget {
  const CancelButton({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomTextButton(
      onPressed: () {
        Navigator.pop(context);
      },
      text: LocaleKeys.cancel.locale,
      isButtonActive: true,
    );
  }
}
