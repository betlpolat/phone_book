import 'package:flutter/material.dart';
import 'package:phone_book/product/init/language/locale_keys.g.dart';
import 'package:phone_book/product/utility/constant/color_constant.dart';
import 'package:phone_book/product/utility/enum/asset_icons.dart';
import 'package:phone_book/product/utility/extension/string_extension.dart';

class SearchTextField extends StatelessWidget {
  const SearchTextField({super.key, required this.onChanged, required this.controller});
  final void Function(String value) onChanged;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      onChanged: (value) async => onChanged(value),
      decoration: InputDecoration(
        fillColor: ColorConstant.white,
        prefixIcon: Image.asset(AssetIcons.search.path()),
        hintText: LocaleKeys.search_hint_text.locale,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: const BorderSide(
            color: ColorConstant.white,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: const BorderSide(
            color: ColorConstant.white,
          ),
        ),
      ),
    );
  }
}
