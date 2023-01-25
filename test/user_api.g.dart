// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_api.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps,no_leading_underscores_for_local_identifiers

class _UserApi implements UserApi {
  _UserApi(
    this._dio, {
    this.baseUrl,
  }) {
    baseUrl ??= 'https://demoapi.ppleapp.com/api/v1/user/';
  }

  final Dio _dio;

  String? baseUrl;

  @override
  Future<ResponseData> createUser(
    username,
    password,
    email,
  ) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = {
      'username': username,
      'password': password,
      'email': email,
    };
    final _result = await _dio
        .fetch<Map<String, dynamic>>(_setStreamType<ResponseData>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              'create/user',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = ResponseData.fromMap(_result.data!);
    return value;
  }

  @override
  Future<ResponseData> verifyUser(username) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio
        .fetch<Map<String, dynamic>>(_setStreamType<ResponseData>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              'verify/user/${username}',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = ResponseData.fromMap(_result.data!);
    return value;
  }

  @override
  Future<ResponseData> changePassword(
    username,
    oldPassword,
    newPassword,
  ) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = {
      'username': username,
      'old_password': oldPassword,
      'new_password': newPassword,
    };
    final _result = await _dio
        .fetch<Map<String, dynamic>>(_setStreamType<ResponseData>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              'change-password',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = ResponseData.fromMap(_result.data!);
    return value;
  }

  @override
  Future<ResponseData> loginUser(
    username,
    password,
  ) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = {
      'username': username,
      'password': password,
    };
    final _result = await _dio
        .fetch<Map<String, dynamic>>(_setStreamType<ResponseData>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              'login-user',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = ResponseData.fromMap(_result.data!);
    return value;
  }

  @override
  Future<ResponseData> getUserProfile(id) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio
        .fetch<Map<String, dynamic>>(_setStreamType<ResponseData>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              'user-profile/${id}',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = ResponseData.fromMap(_result.data!);
    return value;
  }

  @override
  Future<ResponseData> editProfileAvatar(
    username,
    avatar,
  ) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = {
      'username': username,
      'avatar': avatar,
    };
    final _result = await _dio
        .fetch<Map<String, dynamic>>(_setStreamType<ResponseData>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              'edit-profile-avatar',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = ResponseData.fromMap(_result.data!);
    return value;
  }

  @override
  Future<ResponseData> deleteAccount(username) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = {'username': username};
    final _result = await _dio
        .fetch<Map<String, dynamic>>(_setStreamType<ResponseData>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              'delete-account',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = ResponseData.fromMap(_result.data!);
    return value;
  }

  RequestOptions _setStreamType<T>(RequestOptions requestOptions) {
    if (T != dynamic &&
        !(requestOptions.responseType == ResponseType.bytes ||
            requestOptions.responseType == ResponseType.stream)) {
      if (T == String) {
        requestOptions.responseType = ResponseType.plain;
      } else {
        requestOptions.responseType = ResponseType.json;
      }
    }
    return requestOptions;
  }
}
