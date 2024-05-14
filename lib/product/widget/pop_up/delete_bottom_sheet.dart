import 'package:flutter/material.dart';
import 'package:phone_book/product/init/language/locale_keys.g.dart';
import 'package:phone_book/product/utility/constant/color_constant.dart';
import 'package:phone_book/product/utility/extension/index.dart';
import 'package:phone_book/product/widget/button/title_text_button.dart';
import 'package:phone_book/product/widget/text/index.dart';

class DeleteBottomSheet extends StatelessWidget {
  const DeleteBottomSheet({
    super.key,
    required this.onPressedYes,
  });
  final VoidCallback onPressedYes;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: context.dynamicHeight(0.3),
      width: context.width,
      decoration: BoxDecoration(
        color: ColorConstant.white,
        borderRadius: BorderRadius.circular(20),
      ),
      padding: context.paddingMedium,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          TitleText(
            text: LocaleKeys.delete_account.locale,
            color: ColorConstant.redDeleteAccount,
          ),
          Container(
              width: context.width,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: ColorConstant.pageColor,
                borderRadius: BorderRadius.circular(10),
              ),
              height: context.dynamicHeight(0.07),
              child: TitleTextButton(
                onPressed: onPressedYes,
                title: LocaleKeys.yes.locale,
              )),
          Container(
              width: context.width,
              height: context.dynamicHeight(0.07),
              decoration: BoxDecoration(
                color: ColorConstant.pageColor,
                borderRadius: BorderRadius.circular(10),
              ),
              alignment: Alignment.center,
              child: TitleTextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                title: LocaleKeys.no.locale,
              )),
        ],
      ),
    );
  }
}
