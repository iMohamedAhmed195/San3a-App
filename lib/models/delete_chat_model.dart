class DeleteChatModel{
  late bool status;
  late String message;

  DeleteChatModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
  }
}