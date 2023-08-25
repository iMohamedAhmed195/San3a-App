class AdminGetUsersModel {
  int? length;
  bool? status;
  String? message;
  List<Data>? data;

  AdminGetUsersModel({this.length, this.status, this.message, this.data});

  AdminGetUsersModel.fromJson(Map<String, dynamic> json) {
    length = json['length'];
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['length'] = this.length;
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  String? sId;
  String? name;
  String? photo;
  int? rateAverage;
  String? id;

  Data({this.sId, this.name, this.photo, this.rateAverage, this.id});

  Data.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    photo = json['photo'];
    rateAverage = json['rateAverage'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['name'] = this.name;
    data['photo'] = this.photo;
    data['rateAverage'] = this.rateAverage;
    data['id'] = this.id;
    return data;
  }
}