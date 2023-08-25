class AddPostModel {
  late bool status;
  late String message;

  AddPostModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
  }

}
