class ResetPassword_model {
  late bool status;
  late String message;

  ResetPassword_model.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
  }
}
