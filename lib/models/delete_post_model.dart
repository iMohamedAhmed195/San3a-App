class DeletePostModel{
  late bool status;
  late String message;

  DeletePostModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
  }
}