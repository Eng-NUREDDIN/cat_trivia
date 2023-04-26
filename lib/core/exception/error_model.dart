import 'package:equatable/equatable.dart';

class ErrorModel extends Equatable {
  final String errorMessage;
  final int errorCode;
  final bool success;

  const ErrorModel({
    required this.errorMessage,
    required this.errorCode,
    required this.success,
  });

  factory ErrorModel.fromJson(Map<String, dynamic> json) {
    return ErrorModel(
      errorMessage: json["status_message"],
      errorCode: json["status_code"],
      success: json["success"],
    );
  }

  @override
  List<Object?> get props => [errorMessage, errorCode, success];
}
