import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:vexana/vexana.dart';

part 'post_response.g.dart';

@JsonSerializable()
class PostResponse extends INetworkModel<PostResponse> with EquatableMixin {
  PostResponse({this.success, this.messages, this.data, this.status});

  factory PostResponse.fromJson(Map<String, dynamic> json) {
    return _$PostResponseFromJson(json);
  }
  final bool? success;
  final List<String>? messages;
  final UserInfo? data;
  final int? status;

  @override
  PostResponse fromJson(Map<String, dynamic> json) {
    return _$PostResponseFromJson(json);
  }

  @override
  List<Object?> get props => [success, messages, status];

  @override
  Map<String, dynamic>? toJson() => _$PostResponseToJson(this);

  PostResponse copyWith({
    bool? success,
    List<String>? messages,
    int? status,
  }) {
    return PostResponse(
      success: success ?? this.success,
      messages: messages ?? this.messages,
      status: status ?? this.status,
    );
  }
}

@JsonSerializable()
class UserInfo extends INetworkModel<UserInfo> with EquatableMixin {
  final String? id;
  final String? createdAt;
  final String? firstName;
  final String? lastName;
  final String? phoneNumber;
  final String? profileImageUrl;

  UserInfo({this.id, this.createdAt, this.firstName, this.lastName, this.phoneNumber, this.profileImageUrl});

  factory UserInfo.fromJson(Map<String, dynamic> json) {
    return _$UserInfoFromJson(json);
  }

  @override
  Map<String, dynamic>? toJson() => _$UserInfoToJson(this);

  @override
  UserInfo fromJson(Map<String, dynamic> json) {
    return _$UserInfoFromJson(json);
  }

  @override
  List<Object?> get props => [id, firstName, lastName, createdAt, phoneNumber, profileImageUrl];

  UserInfo copyWith({
    String? id,
    String? createdAt,
    String? firstName,
    String? lastName,
    String? phoneNumber,
    String? profileImageUrl,
  }) {
    return UserInfo(
      id: id ?? this.id,
      createdAt: createdAt ?? this.createdAt,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      profileImageUrl: profileImageUrl ?? this.profileImageUrl,
    );
  }
}
