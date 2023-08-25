class UpdatePostModel{
  late bool status;
  late String message;

  UpdatePostModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
  }
}