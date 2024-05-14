import 'package:flutter/material.dart';
import 'package:phone_book/feature/contacts/view/contacts_view.dart';
import 'package:phone_book/feature/contacts/view_model/contacts_view_model.dart';
import 'package:phone_book/product/service/manager/product_network_manager.dart';
import 'package:phone_book/product/service/user_service.dart';

mixin ContactsViewMixin on State<ContactsView> {
  late final ContactsViewModel _contactsViewModel;
  late ProductNetworkManager manager;
  final TextEditingController searchController = TextEditingController();

  ContactsViewModel get contactsViewModel => _contactsViewModel;
  @override
  void initState() {
    super.initState();
    manager = ProductNetworkManager.base();
    _contactsViewModel = ContactsViewModel(userService: UserService(networkManager: manager));

    _contactsViewModel.fetchUsers();
  }

  void goContact() {}
  Future<void> search() async {
    await _contactsViewModel.searchUsers(searchController.text);
  }
}
