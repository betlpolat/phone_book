import 'package:phone_book/product/utility/enum/network_path.dart';
import 'package:phone_book/product/utility/model/user.dart';
import 'package:phone_book/product/utility/model/user_post.dart';
import 'package:vexana/vexana.dart';

import 'package:phone_book/product/utility/model/post_response.dart';

final class UserService {
  UserService({
    required INetworkManager<EmptyModel> networkManager,
  }) : _networkManager = networkManager;
  final INetworkManager<EmptyModel> _networkManager;

  Future<List<Users>?> fetchUserList() async {
    final response = await _networkManager.send<User, User>(
      NetworkPath.USER.withQuery('?skip=0&take=30'),
      parseModel: const User(),
      method: RequestType.GET,
    );

    return response.data?.data?.users ?? [];
  }

  Future<List<Users>?> searchUser(String text) async {
    final response = await _networkManager.send<User, User>(
      NetworkPath.USER.withQuery('?search=${text}&skip=0&take=30'),
      parseModel: const User(),
      method: RequestType.GET,
    );

    return response.data?.data?.users ?? [];
  }

  Future<PostResponse?> postUser({required UserPost user, String id = '00'}) async {
    print(id);
    final response = await _networkManager.send<PostResponse, PostResponse>(
      NetworkPath.USER.withQuery(id == '00' ? '' : id),
      parseModel: PostResponse(),
      method: id == '00' ? RequestType.POST : RequestType.PUT,
      data: user,
    );
    print(response.data?.success);
    return response.data;
  }

  Future<PostResponse?> deleteUser({required String id}) async {
    final response = await _networkManager.send<PostResponse, PostResponse>(
      NetworkPath.USER.withQuery(id),
      parseModel: PostResponse(),
      method: RequestType.DELETE,
    );
    print(response.data?.success);
    return response.data;
  }
}
