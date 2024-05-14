// ignore_for_file:  sort_constructors_first
// ignore_for_file: public_member_api_docs

import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:vexana/vexana.dart';
part 'user.g.dart';

@JsonSerializable()
class User extends INetworkModel<User> with EquatableMixin {
  const User({this.success, this.messages, this.data, this.status});

  factory User.fromJson(Map<String, dynamic> json) {
    return _$UserFromJson(json);
  }
  @override
  Map<String, dynamic> toJson() => _$UserToJson(this);
  final bool? success;
  final List<String>? messages;
  final Data? data;
  final int? status;

  @override
  List<Object?> get props => [success, messages, data, status];

  User copyWith({
    bool? success,
    List<String>? messages,
    Data? data,
    int? status,
  }) {
    return User(
      success: success ?? this.success,
      messages: messages ?? this.messages,
      data: data ?? this.data,
      status: status ?? this.status,
    );
  }

  @override
  User fromJson(Map<String, dynamic> json) {
    return _$UserFromJson(json);
  }
}

@JsonSerializable()
class Data extends INetworkModel<Data> with EquatableMixin {
  const Data({this.users});
  factory Data.fromJson(Map<String, dynamic> json) {
    return _$DataFromJson(json);
  }
  @override
  Map<String, dynamic> toJson() => _$DataToJson(this);

  final List<Users>? users;
  @override
  List<Object?> get props => [users];

  Data copyWith({
    List<Users>? users,
  }) {
    return Data(
      users: users ?? this.users,
    );
  }

  @override
  Data fromJson(Map<String, dynamic> json) {
    return _$DataFromJson(json);
  }
}

@JsonSerializable()
class Users extends INetworkModel<Users> with EquatableMixin {
  const Users({
    this.id,
    this.createdAt,
    this.firstName,
    this.lastName,
    this.phoneNumber,
    this.profileImageUrl,
  });

  factory Users.fromJson(Map<String, dynamic> json) {
    return _$UsersFromJson(json);
  }

  final String? id;
  final String? createdAt;
  final String? firstName;
  final String? lastName;
  final String? phoneNumber;
  final String? profileImageUrl;
  @override
  Map<String, dynamic> toJson() => _$UsersToJson(this);

  @override
  List<Object?> get props => [id, createdAt, firstName, lastName, phoneNumber, profileImageUrl];

  Users copyWith({
    String? id,
    String? createdAt,
    String? firstName,
    String? lastName,
    String? phoneNumber,
    String? profileImageUrl,
  }) {
    return Users(
      id: id ?? this.id,
      createdAt: createdAt ?? this.createdAt,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      profileImageUrl: profileImageUrl ?? this.profileImageUrl,
    );
  }

  @override
  Users fromJson(Map<String, dynamic> json) {
    return _$UsersFromJson(json);
  }
}
