import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:phone_book/feature/edit_profile/view/mixin/edit_profile_view_mixin.dart';
import 'package:phone_book/feature/new_contact/view_model/new_contact_state.dart';
import 'package:phone_book/feature/new_contact/view_model/new_contact_view_model.dart';
import 'package:phone_book/product/init/language/locale_keys.g.dart';
import 'package:phone_book/product/utility/constant/color_constant.dart';
import 'package:phone_book/product/utility/extension/index.dart';
import 'package:phone_book/product/utility/model/user.dart';
import 'package:phone_book/product/widget/button/index.dart';
import 'package:phone_book/product/widget/pop_up/add_photo_bottom_sheet.dart';
import 'package:phone_book/product/widget/pop_up/custom_bottom_sheet.dart';
import 'package:phone_book/product/widget/pop_up/delete_bottom_sheet.dart';
import 'package:phone_book/product/widget/text/bold_medium_text.dart';
import 'package:phone_book/product/widget/text_field/form_text_field.dart';
import '../../../product/utility/enum/index.dart';

class EditProfileView extends StatefulWidget {
  const EditProfileView({
    super.key,
    required this.user,
  });
  final Users user;
  @override
  State<EditProfileView> createState() => _EditProfileViewViewState();
}

class _EditProfileViewViewState extends State<EditProfileView> with EditProfileViewMixin {
  final ImagePicker picker = ImagePicker();
  XFile? image = XFile('');
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
                  onPressed: updateUser,
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
          title: '',
          image: image?.path == ''
              ? Image.asset(
                  AssetIcons.profile.path(),
                  height: context.dynamicHeight(0.2),
                  fit: BoxFit.cover,
                )
              : Container(
                  height: context.dynamicHeight(0.2),
                  width: context.dynamicHeight(0.2),
                  child: CircleAvatar(
                    backgroundImage: Image.file(
                      File(image!.path),
                      fit: BoxFit.cover,
                    ).image,
                  ),
                ),
          changePhotoButton: () {
            showModalBottomSheet(
              context: context,
              isScrollControlled: true,
              builder: (context) {
                return AddPhotoBottomSheet(onPressedCamera: () async {
                  print("-------------");
                  image = await picker.pickImage(source: ImageSource.camera);
                  File file = File(image!.path);
                  profileImageUrl = base64Encode(file.readAsBytesSync());

                  setState(() {});
                  Navigator.pop(context);
                }, onPressedGallery: () async {
                  image = await picker.pickImage(source: ImageSource.gallery);
                  File file = File(image!.path);
                  profileImageUrl = base64Encode(file.readAsBytesSync());

                  setState(() {});
                  Navigator.pop(context);
                });
              },
            );
          },
          photoText: profileImageUrl != '' ? LocaleKeys.change_photo.locale : LocaleKeys.add_photo.locale,
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
