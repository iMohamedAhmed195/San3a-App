class PaymentPaidModel {
  int? length;
  bool? status;
  String? message;
  List<Date>? date;

  PaymentPaidModel({this.length, this.status, this.message, this.date});

  PaymentPaidModel.fromJson(Map<String, dynamic> json) {
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
  String? name;
  String? photo;
  String? job;
  String? id;

  Date({this.sId, this.name, this.photo, this.job, this.id});

  Date.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    photo = json['photo'];
    job = json['job'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['name'] = this.name;
    data['photo'] = this.photo;
    data['job'] = this.job;
    data['id'] = this.id;
    return data;
  }
}