import 'dart:convert';

import 'package:collection/collection.dart';

class ResponseData {
  String? status;
  String? message;

  ResponseData({this.status, this.message});

  @override
  String toString() => 'ResponseData(status: $status, message: $message)';

  factory ResponseData.fromMap(Map<String, dynamic> data) => ResponseData(
        status: data['status'] as String?,
        message: data['message'] as String?,
      );

  Map<String, dynamic> toMap() => {
        'status': status,
        'message': message,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [ResponseData].
  factory ResponseData.fromJson(String data) {
    return ResponseData.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [ResponseData] to a JSON string.
  String toJson() => json.encode(toMap());

  ResponseData copyWith({
    String? status,
    String? message,
  }) {
    return ResponseData(
      status: status ?? this.status,
      message: message ?? this.message,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! ResponseData) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toMap(), toMap());
  }

  @override
  int get hashCode => status.hashCode ^ message.hashCode;
}
