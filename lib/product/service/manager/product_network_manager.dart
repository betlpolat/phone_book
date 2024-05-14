import 'dart:io';

import 'package:flutter/material.dart';
import 'package:phone_book/product/utility/constant/path_constant.dart';
import 'package:vexana/vexana.dart';

/// Product network manager

final class ProductNetworkManager extends NetworkManager<EmptyModel> {
  ProductNetworkManager.base()
      : super(
          options: BaseOptions(
            baseUrl: PathConstant.basePath,
            headers: {
              'accept': 'text/plain',
              'ApiKey': PathConstant.apiKey,
              'Content-Type': 'application/json',
            },
          ),
        );

  /// Handle error
  /// [onErrorStatus] is error status code [HttpStatus]
  void listenErrorState({required ValueChanged<int> onErrorStatus}) {
    interceptors.add(
      InterceptorsWrapper(
        onError: (e, handler) {
          onErrorStatus(e.response?.statusCode ?? HttpStatus.notFound);
          return handler.next(e);
        },
      ),
    );
  }
}
