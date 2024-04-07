import 'package:dio/dio.dart';
import 'package:notes/features/users_paginations/data/models/user_model.dart';

import '../../../../core/networking/api_handler.dart';
import '../../../../core/networking/api_result.dart';

class UsersRepo {
  final ApiHandler _apiHandler;

  UsersRepo(this._apiHandler);

  Future<ApiResult<Map<String, dynamic>>> getSomeUsers(
      Map<String, dynamic> pagination) async {
    // var users = await _apiHandler.getSomeUsers(pagination);
    try {
      var users = await _apiHandler.getSomeUsers(pagination);

      return ApiResult.success(users);
    } on DioException catch (error) {
      if (error.response != null) {
        return ApiResult.failure(error.response!.data["error"]);
      } else {
        return ApiResult.failure("error.message!");
      }
    }
  }
}
