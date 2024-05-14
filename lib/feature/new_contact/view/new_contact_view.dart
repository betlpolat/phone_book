import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:phone_book/feature/new_contact/view/mixin/new_contact_view_mixin.dart';
import 'package:phone_book/product/init/language/locale_keys.g.dart';
import 'package:phone_book/product/utility/constant/color_constant.dart';
import 'package:phone_book/product/utility/extension/index.dart';
import 'package:phone_book/product/utility/model/user.dart';
import 'package:phone_book/product/widget/button/index.dart';
import 'package:phone_book/product/widget/pop_up/custom_bottom_sheet.dart';
import 'package:phone_book/product/widget/pop_up/delete_bottom_sheet.dart';
import 'package:phone_book/product/widget/text/bold_medium_text.dart';
import 'package:phone_book/product/widget/text_field/form_text_field.dart';
import '../../../product/utility/enum/index.dart';
import '../view_model/index.dart';

class NewContactView extends StatefulWidget {
  const NewContactView({
    super.key,
    this.user,
  });
  final Users? user;

  @override
  State<NewContactView> createState() => _NewContactViewState();
}

class _NewContactViewState extends State<NewContactView> with NewContactViewMixin {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => newContactViewModel,
      child: CustomBottomSheet(
          rightTextButton: BlocConsumer<NewContactViewModel, NewContactState>(
            listener: (context, state) {},
            builder: (context, state) {
              if (state.onEdit) {
                return CustomTextButton(
                  onPressed: onPressedEdit,
                  text: LocaleKeys.edit.locale,
                  isButtonActive: true,
                );
              } else if (state.onComplete) {
                return CustomTextButton(
                  onPressed: saveUser,
                  text: LocaleKeys.done.locale,
                  isButtonActive: true,
                );
              } else {
                return CustomTextButton(
                  onPressed: () {},
                  text: LocaleKeys.done.locale,
                  isButtonActive: false,
                );
              }
            },
          ),
          title: LocaleKeys.new_contact.locale,
          image: Image.asset(
            AssetIcons.profile.path(),
            height: context.dynamicHeight(0.2),
            fit: BoxFit.cover,
          ),
          changePhotoButton: () {},
          photoText: LocaleKeys.add_photo.locale,
          child: BlocConsumer<NewContactViewModel, NewContactState>(
              listener: (context, state) {},
              builder: (context, state) {
                if (state.onEdit) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      BoldMediumText(
                        text: firstNameController.text,
                      ),
                      Divider(
                        height: 20,
                      ),
                      BoldMediumText(text: lastNameController.text),
                      Divider(
                        height: 20,
                      ),
                      BoldMediumText(text: phoneNumberController.text),
                      Divider(
                        height: 20,
                      ),
                      NormalTextButton(
                        onPressed: () {
                          showModalBottomSheet(
                            context: context,
                            isScrollControlled: true,
                            builder: (context) {
                              return DeleteBottomSheet(
                                onPressedYes: deleteUser,
                              );
                            },
                          );
                        },
                        title: LocaleKeys.delete_contact.locale,
                        color: ColorConstant.redDeleteAccount,
                      ),
                    ],
                  );
                } else {
                  return Column(
                    children: [
                      Padding(
                        padding: context.paddingLowTop,
                        child: FormTextField(
                          controller: firstNameController,
                          onChanged: (value) {
                            isFormCompleted();
                          },
                          hintText: LocaleKeys.first_name.locale,
                        ),
                      ),
                      Padding(
                        padding: context.paddingLowTop,
                        child: FormTextField(
                          controller: lastNameController,
                          onChanged: (value) {
                            isFormCompleted();
                          },
                          hintText: LocaleKeys.last_name.locale,
                        ),
                      ),
                      Padding(
                        padding: context.paddingLowTop,
                        child: FormTextField(
                          controller: phoneNumberController,
                          onChanged: (value) {
                            isFormCompleted();
                          },
                          hintText: LocaleKeys.phone_number.locale,
                        ),
                      ),
                    ],
                  );
                }
              })),
    );
  }
}
