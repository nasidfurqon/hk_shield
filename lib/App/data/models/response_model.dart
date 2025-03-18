class ResponseModel {
  final bool? success;
  final int? status;
  final String? message;
  final dynamic data;

  ResponseModel({
    this.success,
    this.status,
    this.message,
    this.data,
  });

  factory ResponseModel.fromJson(Map<String, dynamic> json) {
    return ResponseModel(
      success: json['success'],
      status: json['status'],
      message: json['message'],
      data: json['data'],
    );
  }

  Map<String, dynamic> toJson() =>
      {
        'success': success,
        'status': success,
        'message': message,
        'data': data,
      };
}
