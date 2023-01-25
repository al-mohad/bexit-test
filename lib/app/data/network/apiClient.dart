import 'package:bexit_test/app/data/models/response_data.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';

import 'apis.dart';

part 'apiClient.g.dart';

@RestApi(baseUrl: "https://5d42a6e2bc64f90014a56ca0.mockapi.io/api/v1/")
abstract class ApiClient {
  static bool isLiveEnvironment = false;

  static String devUrl = "https://demoapi.ppleapp.com/api/v1/user/";
  static String liveUrl = "https://demoapi.ppleapp.com/api/v1/user/";

  static String baseUrl = isLiveEnvironment ? liveUrl : devUrl;
  factory ApiClient(Dio dio, {String baseUrl}) = _ApiClient;

  //----------------------Auth endpoints-----------------------------
  @POST(Apis.createUser)
  Future<ResponseData> createUser(@Body() Map<String, dynamic> data);

  @GET('${Apis.verifyUser}/{code}')
  Future<ResponseData> verifyUser(
    @Path('code') String code,
  );

  @POST(Apis.changePassword)
  Future<ResponseData> changePassword(@Body() Map<String, dynamic> data);

  @POST(Apis.login)
  Future<ResponseData> login(@Body() Map<String, dynamic> data);

  @POST(Apis.userAccount)
  Future<ResponseData> getUserInfo(@Body() Map<String, dynamic> data);

  @POST(Apis.editProfileAvatar)
  Future<ResponseData> uploadAvatar(
    @Body() FormData data,
  );

  @GET(Apis.deleteAccount)
  Future<ResponseData> deleteAccount(@Body() Map<String, dynamic> data);
}

// fvm flutter pub run build_runner build --delete-conflicting-outputs
