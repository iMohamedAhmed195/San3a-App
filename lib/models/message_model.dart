class MessagesModel {
  late bool status;
  late String message;
  late String chatID;
  List<Data>? data;



  MessagesModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    chatID = json['chatID'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add( Data.fromJson(v));
      });
    }
  }


}

class Data {
  String? sId;
  String? sender;
  String? text;
  String? image;
  String? createdAt;
  String? updatedAt;
  int? iV;
  String? time;
  String? date;


  Data.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    sender = json['sender'];
    text = json['text'];
    image = json['image'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
    time = json['time'];
    date = json['date'];
  }


}


