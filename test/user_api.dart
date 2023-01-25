import 'package:bexit_test/app/data/models/response_data.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:retrofit/http.dart';
import 'package:retrofit/retrofit.dart';

part 'user_api.g.dart';

@RestApi(baseUrl: "https://demoapi.ppleapp.com/api/v1/user/")
abstract class UserApi {
  factory UserApi(Dio dio) = _UserApi;

  // 1. create user endpoint
  @POST("create/user")
  Future<ResponseData> createUser(@Field("username") String username,
      @Field("password") String password, @Field("email") String email);

  // 2. verify user endpoint
  @GET("verify/user/{username}")
  Future<ResponseData> verifyUser(@Path("username") String username);

  // 3. change password endpoint
  @POST("change-password")
  Future<ResponseData> changePassword(
      @Field("username") String username,
      @Field("old_password") String oldPassword,
      @Field("new_password") String newPassword);

  // 4. login user endpoint
  @POST("login-user")
  Future<ResponseData> loginUser(
      @Field("username") String username, @Field("password") String password);
  // 5. get user profile endpoint
  @GET("user-profile/{id}")
  Future<ResponseData> getUserProfile(@Path("id") String id);

  // 6. edit profile avatar endpoint
  @POST("edit-profile-avatar")
  Future<ResponseData> editProfileAvatar(
      @Field("username") String username, @Field("avatar") String avatar);

  // 7. delete account endpoint
  @POST("delete-account")
  Future<ResponseData> deleteAccount(@Field("username") String username);
}
