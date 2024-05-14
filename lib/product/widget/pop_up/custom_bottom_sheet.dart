import 'package:flutter/material.dart';
import 'package:phone_book/product/utility/constant/color_constant.dart';
import 'package:phone_book/product/utility/extension/context_extension.dart';

import 'package:phone_book/product/widget/text/bold_medium_text.dart';

import '../button/index.dart';

class CustomBottomSheet extends StatelessWidget {
  const CustomBottomSheet({
    required this.rightTextButton,
    required this.image,
    required this.changePhotoButton,
    required this.child,
    required this.photoText,
    this.title,
    super.key,
  });

  final Widget rightTextButton;
  final String? title;
  final Widget image;
  final VoidCallback changePhotoButton;
  final String photoText;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: context.dynamicHeight(0.95),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Container(
          padding: context.paddingNormal,
          decoration: BoxDecoration(
            color: ColorConstant.white,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const CancelButton(),
                  BoldMediumText(text: title ?? ''),
                  rightTextButton,
                ],
              ),
              Center(
                child: Padding(padding: context.paddingMediumTop, child: image),
              ),
              Center(child: NormalTextButton(onPressed: changePhotoButton, title: photoText)),
              child,
            ],
          ),
        ),
      ),
    );
  }
}
