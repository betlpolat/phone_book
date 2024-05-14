import 'package:flutter/material.dart';
import 'package:phone_book/product/init/language/locale_keys.g.dart';
import 'package:phone_book/product/utility/enum/asset_icons.dart';
import 'package:phone_book/product/utility/extension/index.dart';
import '../../../../product/utility/constant/index.dart';
import '../../../../product/widget/text/index.dart';

class NoContacts extends StatelessWidget {
  const NoContacts({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(AssetIcons.profile.path()),
        TitleText(
          text: LocaleKeys.no_contacts.locale,
        ),
        BoldMediumText(
          text: LocaleKeys.new_contact_exp.locale,
        ),
        BoldMediumText(
          text: LocaleKeys.create_contact.locale,
          textColor: ColorConstant.blue,
        ),
      ],
    );
  }
}
