class AdminGetWorkerModel {
  int? length;
  String? message;
  bool? status;
  List<Data>? data;

  AdminGetWorkerModel({this.length, this.message, this.status, this.data});

  AdminGetWorkerModel.fromJson(Map<String, dynamic> json) {
    length = json['length'];
    message = json['message'];
    status = json['status'];
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
    data['message'] = this.message;
    data['status'] = this.status;
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
  String? bio;
  String? id;

  Data({this.sId, this.name, this.photo, this.rateAverage, this.bio, this.id});

  Data.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    photo = json['photo'];
    rateAverage = json['rateAverage'];
    bio = json['bio'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['name'] = this.name;
    data['photo'] = this.photo;
    data['rateAverage'] = this.rateAverage;
    data['bio'] = this.bio;
    data['id'] = this.id;
    return data;
  }
}