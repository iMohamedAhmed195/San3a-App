class SendMessage {
  late bool status;
  late String message;
  Data? data;



  SendMessage.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ?  Data.fromJson(json['data']) : null;
  }


}

class Data {
  String? sender;
  Content? content;
  String? time;


  Data.fromJson(Map<String, dynamic> json) {
    sender = json['sender'];
    content =
    json['content'] != null ?  Content.fromJson(json['content']) : null;
    time = json['time'];
  }

}

class Content {
  String? text;
  Null? image;



  Content.fromJson(Map<String, dynamic> json) {
    text = json['text'];
    image = json['image'];
  }


}
