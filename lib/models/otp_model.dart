class OtpModel{
  late bool status;
  late String message;
  late String token;
  OtpModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    token = json['token'];
  }
}

