import 'package:dio/dio.dart';
import 'package:notes/features/login/data/models/user_token.dart';

import '../../../../core/networking/api_handler.dart';
import '../../../../core/networking/api_result.dart';

class LoginRepo {
  final ApiHandler _apiHandler;

  LoginRepo(this._apiHandler);

  Future<ApiResult<userToken>> login(Map<String, dynamic> userInputData) async {
    try {
      var userToken = await _apiHandler.login(userInputData);

      return ApiResult.success(userToken);
    } on DioException catch (error) {
      return ApiResult.failure(error.response!.data["error"]);
    }
  }
}
