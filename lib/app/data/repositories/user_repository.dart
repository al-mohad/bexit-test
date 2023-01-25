import 'package:bexit_test/app/data/models/response_data.dart';

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
}
