import 'package:flutter/material.dart';
import 'package:phone_book/product/utility/constant/color_constant.dart';

class FormTextField extends StatelessWidget {
  const FormTextField({required this.hintText, required this.controller, required this.onChanged, super.key});
  final String hintText;
  final TextEditingController controller;
  final void Function(String value) onChanged;
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      onChanged: onChanged,
      decoration: InputDecoration(
        hintText: hintText,
        fillColor: ColorConstant.pageColor,
      ),
    );
  }
}
