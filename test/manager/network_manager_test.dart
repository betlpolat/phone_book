import 'package:flutter_test/flutter_test.dart';
import 'package:phone_book/product/service/manager/product_network_manager.dart';
import 'package:phone_book/product/utility/enum/network_path.dart';
import 'package:phone_book/product/utility/model/post_response.dart';
import 'package:phone_book/product/utility/model/user.dart';
import 'package:phone_book/product/utility/model/user_post.dart';

import 'package:vexana/vexana.dart';

void main() {
  late ProductNetworkManager manager;

  setUp(() {
    manager = ProductNetworkManager.base();
  });

  group('Network Manager Test', () {
    test('get user items from api ', () async {
      final response = await manager.send<User, User>(
        NetworkPath.USER.withQuery('?skip=0&take=10'),
        parseModel: const User(),
        method: RequestType.GET,
      );

      expect(response.data?.data?.users, isList);
    });

    test('post user items from api ', () async {
      final response = await manager.send<PostResponse, PostResponse>(
        NetworkPath.USER.withQuery(''),
        parseModel: PostResponse(),
        method: RequestType.POST,
        data: UserPost(
          firstName: 'B',
          lastName: 'P',
          phoneNumber: '1',
          profileImageUrl: 'd',
        ),
      );
      expect(response.data?.status, 200);
    });

    test('put user items from api ', () async {
      const id = '6640ddc7720f4dd266a3b463';
      final response = await manager.send<PostResponse, PostResponse>(
        NetworkPath.USER.withQuery(id),
        parseModel: PostResponse(),
        method: RequestType.PUT,
        data: UserPost(
          firstName: 'B',
          lastName: 'P',
          phoneNumber: '1',
          profileImageUrl: 'd',
        ),
      );
      expect(response.data?.status, 200);
    });
  });
}
