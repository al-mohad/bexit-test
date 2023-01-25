import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';

import 'user_api.dart';

void main() {
  test('create user endpoint', () async {
    final dio = Dio();
    final client = UserApi(dio);
    final response = await client.createUser(
        "testuser", "testpassword", "testuser@example.com");
    expect(response.status, 201);
    expect(response.message, 'User created successfully');
  });

  test('verify user endpoint', () async {
    final dio = Dio();
    final client = UserApi(dio);
    final response = await client.verifyUser("testuser");
    expect(response.status, 200);
    expect(response.message, 'User verified successfully');
  });

  test('change password endpoint', () async {
    final dio = Dio();
    final client = UserApi(dio);
    final response =
        await client.changePassword("testuser", "oldpassword", "newpassword");
    expect(response.status, 200);
    expect(response.message, 'Password changed successfully');
  });
  test('login user endpoint', () async {
    final dio = Dio();
    final client = UserApi(dio);
    final response = await client.loginUser("testuser", "testpassword");
    expect(response.status, 200);
    expect(response.message, 'User logged in successfully');
  });

  test('get user profile endpoint', () async {
    final dio = Dio();
    final client = UserApi(dio);
    final response = await client.getUserProfile("12345");
    expect(response.status, 200);
    expect(response.message, 'User profile retrieved successfully');
  });

  test('edit profile avatar endpoint', () async {
    final dio = Dio();
    final client = UserApi(dio);
    final response =
        await client.editProfileAvatar("testuser", "new_avatar.jpg");
    expect(response.status, 200);
    expect(response.message, 'Profile avatar updated successfully');
  });

  test('delete account endpoint', () async {
    final dio = Dio();
    final client = UserApi(dio);
    final response = await client.deleteAccount("testuser");
    expect(response.status, 200);
    expect(response.message, 'Account deleted successfully');
  });
}
