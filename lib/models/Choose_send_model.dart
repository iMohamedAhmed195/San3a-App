class ChooseSendModel {
  late bool status;
  late String message;

  ChooseSendModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
  }
}
