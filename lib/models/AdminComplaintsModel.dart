class AdminComplaintsModel {
  int? length;
  bool? status;
  String? message;
  List<Date>? date;

  AdminComplaintsModel({this.length, this.status, this.message, this.date});

  AdminComplaintsModel.fromJson(Map<String, dynamic> json) {
    length = json['length'];
    status = json['status'];
    message = json['message'];
    if (json['date'] != null) {
      date = <Date>[];
      json['date'].forEach((v) {
        date!.add(new Date.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['length'] = this.length;
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.date != null) {
      data['date'] = this.date!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Date {
  String? sId;
  UserId? userId;
  String? description;
  List<String>? image;
  String? date;
  int? iV;

  Date(
      {this.sId,
        this.userId,
        this.description,
        this.image,
        this.date,
        this.iV});

  Date.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    userId =
    json['userId'] != null ? new UserId.fromJson(json['userId']) : null;
    description = json['description'];
    image = json['image'].cast<String>();
    date = json['Date'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    if (this.userId != null) {
      data['userId'] = this.userId!.toJson();
    }
    data['description'] = this.description;
    data['image'] = this.image;
    data['Date'] = this.date;
    data['__v'] = this.iV;
    return data;
  }
}

class UserId {
  String? sId;
  String? name;
  String? email;
  String? photo;
  String? id;

  UserId({this.sId, this.name, this.email, this.photo, this.id});

  UserId.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    email = json['email'];
    photo = json['photo'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['name'] = this.name;
    data['email'] = this.email;
    data['photo'] = this.photo;
    data['id'] = this.id;
    return data;
  }
}