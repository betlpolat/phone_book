import 'package:phone_book/feature/contacts/view_model/contacts_state.dart';
import 'package:phone_book/product/service/user_service.dart';
import 'package:phone_book/product/state/base/base_cubit.dart';
import 'package:vexana/vexana.dart';

/// View model class for contact states
final class ContactsViewModel extends BaseCubit<ContactsState> {
  ContactsViewModel({
    required UserService userService,
  })  : _userService = userService,
        super(const ContactsState());
  late final UserService _userService;

  ///Fetch Users
  Future<void> fetchUsers() async {
    await _getUsersFromService();
  }



  ///Search Users
  Future<void> searchUsers(String text) async {
    try {
      final userList = await _userService.searchUser(text);

      emit(
        state.copyWith(
          userList: userList,
        ),
      );
    } on ErrorModel catch (e) {
      emit(state.copyWith(onError: true, errorMessage: e.description));
    }
  }

  ///Get Users From User Service
  Future<void> _getUsersFromService() async {
    try {
      final userList = await _userService.fetchUserList();
      print(userList?.length.toString() ?? '');
      emit(
        state.copyWith(
          userList: userList,
        ),
      );
    } on ErrorModel catch (e) {
      emit(state.copyWith(onError: true, errorMessage: e.description));
    }
  }
}
