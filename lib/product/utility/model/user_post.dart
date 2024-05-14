import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:vexana/vexana.dart';

part 'user_post.g.dart';

@JsonSerializable()
class UserPost extends INetworkModel<UserPost> with EquatableMixin {
  UserPost({
    this.firstName,
    this.lastName,
    this.phoneNumber,
    this.profileImageUrl,
  });

  factory UserPost.fromJson(Map<String, dynamic> json) {
    return _$UserPostFromJson(json);
  }

  final String? firstName;
  final String? lastName;
  final String? phoneNumber;
  final String? profileImageUrl;
  @override
  Map<String, dynamic> toJson() => _$UserPostToJson(this);

  @override
  UserPost fromJson(Map<String, dynamic> json) {
    return _$UserPostFromJson(json);
  }

  @override
  List<Object?> get props => [firstName, lastName, phoneNumber, profileImageUrl];

  UserPost copyWith({
    String? firstName,
    String? lastName,
    String? phoneNumber,
    String? profileImageUrl,
  }) {
    return UserPost(
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      profileImageUrl: profileImageUrl ?? this.profileImageUrl,
    );
  }
}
