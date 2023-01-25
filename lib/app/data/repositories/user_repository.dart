import 'package:bexit_test/app/data/models/response_data.dart';
import 'package:dio/dio.dart';

import '../network/network.dart';

class UserRepository {
  late NetworkProvider _networkProvider;

  UserRepository() {
    _networkProvider = NetworkProvider.instance;
  }

  Future<ResponseData> register({
    required Map<String, dynamic> data,
  }) {
    return _networkProvider.apiClient.createUser(data);
  }

  Future<ResponseData> login({
    required Map<String, dynamic> data,
  }) {
    return _networkProvider.apiClient.login(data);
  }

  Future<ResponseData> changePassword({
    required Map<String, dynamic> data,
  }) {
    return _networkProvider.apiClient.changePassword(data);
  }

  Future<ResponseData> accountInfo({
    required Map<String, dynamic> data,
  }) {
    return _networkProvider.apiClient.getUserInfo(data);
  }

  Future<ResponseData> uploadPhoto({
    required FormData data,
  }) {
    return _networkProvider.apiClient.uploadAvatar(data);
  }

  Future<ResponseData> verifyAccount({
    required String code,
  }) {
    return _networkProvider.apiClient.verifyUser(code);
  }
}
