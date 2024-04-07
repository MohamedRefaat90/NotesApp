import 'package:dio/dio.dart';
import 'package:notes/features/login/data/models/user_token.dart';
import 'package:retrofit/http.dart';
import 'package:retrofit/retrofit.dart';

import '../../features/users_paginations/data/models/user_model.dart';

part 'api_handler.g.dart';

@RestApi(baseUrl: "https://reqres.in/")
abstract class ApiHandler {
  factory ApiHandler(Dio dio, {String baseUrl}) = _ApiHandler;

  @POST("api/login")
  Future<userToken> login(@Body() Map<String, dynamic> userData);

  @GET("api/users")
  Future getSomeUsers(@Queries() Map<String, dynamic> queries);
}

Dio createDioandSetupInterceptors() {
  Dio dio = Dio();

  dio.options.connectTimeout = const Duration(seconds: 10);
  dio.options.receiveTimeout = const Duration(seconds: 10);

  dio.interceptors.add(LogInterceptor(
    request: true,
    requestHeader: false,
    responseHeader: false,
    error: true,
    requestBody: true,
    responseBody: true,
  ));
  return dio;
}
