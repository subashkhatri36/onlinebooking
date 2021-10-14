import 'dart:convert';

class ApiCall {
  dynamic response;
  String message;
  bool showalert;
  bool status;
  String? errorcode;
  ApiCall({
    this.response,
    required this.message,
    this.showalert = false,
    required this.status,
    this.errorcode = "",
  });

  Map<String, dynamic> toMap() {
    return {
      'data': response,
      'message': message,
      'show_alert': showalert,
      'status': status,
      'error_code': errorcode,
    };
  }

  factory ApiCall.fromMap(Map<String, dynamic> map) {
    return ApiCall(
      response: map['data'],
      message: map['message'],
      showalert: map['show_alert'],
      status: map['status'],
      errorcode: map['error_code'],
    );
  }

  String toJson() => json.encode(toMap());

  factory ApiCall.fromJson(String source) =>
      ApiCall.fromMap(json.decode(source));
}
