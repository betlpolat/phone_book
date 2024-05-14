import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:phone_book/feature/contacts/view/widget/mixin/contacts_view_mixin.dart';
import 'package:phone_book/feature/contacts/view/widget/no_contacts.dart';
import 'package:phone_book/feature/contacts/view_model/index.dart';
import 'package:phone_book/feature/edit_profile/view/edit_profile_view.dart';
import 'package:phone_book/feature/new_contact/view/new_contact_view.dart';
import 'package:phone_book/product/init/language/locale_keys.g.dart';
import 'package:phone_book/product/utility/extension/index.dart';
import 'package:phone_book/product/utility/model/user.dart';
import 'package:phone_book/product/widget/text_field/index.dart';
import '../../../product/utility/constant/index.dart';
import '../../../product/utility/enum/index.dart';
import '../../../product/widget/text/index.dart';

class ContactsView extends StatefulWidget {
  const ContactsView({super.key});

  @override
  State<ContactsView> createState() => _ContactsViewState();
}

class _ContactsViewState extends State<ContactsView> with ContactsViewMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: context.paddingNormal,
        child: Column(
          children: [
            Padding(
              padding: context.paddingMediumVertical,
              child: Row(
                children: [
                  TitleText(
                    text: LocaleKeys.contacts.locale,
                  ),
                  const Spacer(),
                  _addContactButton(context),
                ],
              ),
            ),
            SearchTextField(
              controller: searchController,
              onChanged: (value) {
                search();
              },
            ),
            Expanded(
              child: BlocProvider(
                create: (context) => contactsViewModel,
                child: _contacts(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  InkWell _addContactButton(BuildContext context) {
    return InkWell(
      onTap: () {
        showModalBottomSheet(
          context: context,
          isScrollControlled: true,
          builder: (context) {
            return NewContactView();
          },
        );
      },
      child: Image.asset(AssetIcons.add_button.path()),
    );
  }

  BlocSelector<ContactsViewModel, ContactsState, List<Users>?> _contacts() {
    return BlocSelector<ContactsViewModel, ContactsState, List<Users>?>(selector: (state) {
      return state.userList;
    }, builder: (context, state) {
      return state?.isEmpty ?? true
          ? Center(
              child: NoContacts(),
            )
          : ListView.builder(
              itemCount: state?.length ?? 0,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: context.paddingNormalTop,
                  child: GestureDetector(
                    onTap: () {
                      showModalBottomSheet(
                        context: context,
                        isScrollControlled: true,
                        builder: (context) {
                          return EditProfileView(
                            user: state?[index] ?? Users(),
                          );
                        },
                      );
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: ColorConstant.white,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: ListTile(
                        title: Text(
                          "${state?[index].firstName ?? ''} ${state?[index].lastName ?? ''}",
                        ),
                        subtitle: Text(
                          " +${state?[index].phoneNumber ?? ''}",
                        ),
                      ),
                    ),
                  ),
                );
              },
            );
    });
  }
}
