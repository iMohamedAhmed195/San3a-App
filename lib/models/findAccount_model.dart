class FindAccountModel {
  late bool status;
  late String message;
  Data? data;
  FindAccountModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
}

class Data {
  String? email;
  String? phone;

  Data.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    phone = json['phone'];
  }
}
