import 'package:equatable/equatable.dart';
import 'package:phone_book/product/utility/model/post_response.dart';
import 'package:phone_book/product/utility/model/user.dart';

final class NewContactState extends Equatable {
  const NewContactState({
    this.onSave = false,
    this.onError = false,
    this.errorMessage = '',
    this.onComplete = false,
    this.onEdit = false,
    this.isNew = false,
    this.response = null,
    this.user = null,
  });

  final bool onComplete;
  final bool onSave;
  final bool onError;
  final String errorMessage;
  final bool onEdit;
  final bool isNew;
  final PostResponse? response;
  final Users? user;

  @override
  List<Object?> get props => [onComplete, onSave, onError, errorMessage, onEdit, response];

  NewContactState copyWith({
    bool? onComplete,
    bool? onSave,
    bool? onError,
    String? errorMessage,
    bool? onEdit,
    bool? isNew,
    PostResponse? response,
    Users? user,
  }) {
    return NewContactState(
      response: response ?? this.response,
      onComplete: onComplete ?? false,
      onSave: onSave ?? false,
      onError: onError ?? false,
      errorMessage: errorMessage ?? '',
      onEdit: onEdit ?? false,
      isNew: isNew ?? this.isNew,
      user: user ?? this.user,
    );
  }
}
