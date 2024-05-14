import 'package:flutter/material.dart';
import 'package:phone_book/product/utility/constant/index.dart';
import 'package:phone_book/product/utility/enum/asset_icons.dart';
import 'package:phone_book/product/widget/text/bold_medium_text.dart';
import 'package:phone_book/product/widget/text/index.dart';

class CustomSnackBar {
  void call(BuildContext context, String text) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        backgroundColor: ColorConstant.white,
        content: Row(
          children: [
            Image.asset(AssetIcons.check.path()),
            BoldMediumText(
              text: ' ' + text,
              textColor: ColorConstant.green,
            )
          ],
        )));
  }
}
