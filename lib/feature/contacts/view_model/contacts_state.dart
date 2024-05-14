import 'package:equatable/equatable.dart';
import 'package:phone_book/product/utility/model/user.dart';

final class ContactsState extends Equatable {
  const ContactsState({
    this.onLoad = false,
    this.userList,
    this.onError = false,
    this.errorMessage = '',
  });

  final bool onLoad;
  final List<Users>? userList;
  final bool onError;
  final String errorMessage;
  @override
  List<Object?> get props => [
        onLoad,
        userList,
        onError,
        errorMessage,
      ];

  ContactsState copyWith({
    bool? onLoad,
    List<Users>? userList,
    bool? onError,
    String? errorMessage,
    bool? isLanguageChange,
  }) {
    return ContactsState(
      onLoad: onLoad ?? false,
      userList: userList ?? userList,
      onError: onError ?? false,
      errorMessage: errorMessage ?? '',
    );
  }
}
