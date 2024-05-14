import 'package:phone_book/feature/new_contact/view_model/new_contact_state.dart';
import 'package:phone_book/product/service/user_service.dart';
import 'package:phone_book/product/state/base/base_cubit.dart';
import 'package:phone_book/product/utility/model/user_post.dart';
import 'package:vexana/vexana.dart';

/// View model class for new contact states
final class NewContactViewModel extends BaseCubit<NewContactState> {
  NewContactViewModel({
    required UserService userService,
  })  : _userService = userService,
        super(const NewContactState());
  late final UserService _userService;

  /// Change completed state for true
  void makeCompletedTrue() {
    emit(state.copyWith(onComplete: true));
  }

  void changeIsNew() {
    emit(state.copyWith(isNew: true));
  }

  /// Change completed state for false
  void makeCompletedFalse() {
    emit(state.copyWith(onComplete: false));
  }

  Future<bool> saveUser(UserPost user, {String id = "00"}) async {
    return await _postUsersFromService(user, id: id);
  }

  void changeEdit() {
    emit(state.copyWith(onComplete: true, onEdit: false));
  }

  void contactInit() {
    emit(state.copyWith(onComplete: true, onEdit: true));
  }

  ///Post User From User Service
  Future<bool> _postUsersFromService(UserPost user, {String id = "00"}) async {
    try {
      final response = await _userService.postUser(user: user, id: id);
      if (response?.success ?? false)
        emit(state.copyWith(
          onSave: true,
          onEdit: true,
          isNew: false,
          response: response,
        ));
      return true;
    } on ErrorModel catch (e) {
      emit(state.copyWith(onError: true, errorMessage: e.description));
      return false;
    }
  }

  ///Delete User From User Service
  Future<bool> deleteUserFromService({String id = ''}) async {
    try {
      final response =
          await _userService.deleteUser(id: id == '' ? state.response?.data?.id ?? state.response?.data?.id ?? '' : id);

      return response?.success ?? false;
    } on ErrorModel catch (e) {
      emit(state.copyWith(onError: true, errorMessage: e.description));
      return false;
    }
  }
}
