import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:phone_book/feature/contacts/view_model/contacts_view_model.dart';
import 'package:phone_book/feature/new_contact/view/new_contact_view.dart';
import 'package:phone_book/feature/new_contact/view_model/new_contact_view_model.dart';
import 'package:phone_book/product/init/language/locale_keys.g.dart';
import 'package:phone_book/product/service/manager/product_network_manager.dart';
import 'package:phone_book/product/service/user_service.dart';
import 'package:phone_book/product/utility/extension/index.dart';
import 'package:phone_book/product/utility/model/user_post.dart';
import 'package:phone_book/product/widget/pop_up/custom_snack_bar.dart';

mixin NewContactViewMixin on State<NewContactView> {
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();
  String profileImageUrl = '';
  late final NewContactViewModel _newContactViewModel;
  late final ContactsViewModel _contactsViewModel;
  NewContactViewModel get newContactViewModel => _newContactViewModel;
  ContactsViewModel get contactsViewModel => _contactsViewModel;

  late ProductNetworkManager manager;
  @override
  void initState() {
    super.initState();
    manager = ProductNetworkManager.base();
    _newContactViewModel = NewContactViewModel(userService: UserService(networkManager: manager));
  }

  void isFormCompleted() {
    if (firstNameController.text != '' && lastNameController.text != '' && phoneNumberController.text != '') {
      _newContactViewModel.makeCompletedTrue();
    } else {
      _newContactViewModel.makeCompletedFalse();
    }
  }

  void onPressedEdit() {
    _newContactViewModel.changeEdit();
  }

  Future<void> saveUser() async {
    final response = await _newContactViewModel.saveUser(
      UserPost(
        firstName: firstNameController.text,
        lastName: lastNameController.text,
        phoneNumber: phoneNumberController.text,
        profileImageUrl: profileImageUrl,
      ),
    );
    if (response) {
      CustomSnackBar().call(context, LocaleKeys.user_added.locale);

      _contactsViewModel = ContactsViewModel(userService: UserService(networkManager: manager));
      contactsViewModel.fetchUsers();
    }
  }

  Future<void> deleteUser() async {
    await _newContactViewModel.deleteUserFromService();
    Navigator.pop(context);
    Navigator.pop(context);

    CustomSnackBar().call(context, LocaleKeys.account_deleted.locale);
  }
}
