class SavedPostsModel {
  bool? status;
  int? length;
  String? message;
  List<Data>? data;

  SavedPostsModel({this.status, this.length, this.message, this.data});

  SavedPostsModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    length = json['length'];
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
    data['status'] = this.status;
    data['length'] = this.length;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  String? sId;
  String? description;
  Null? image;
  bool? activity;
  String? job;
  String? savedById;
  List<UserData>? userData;

  Data(
      {this.sId,
        this.description,
        this.image,
        this.activity,
        this.job,
        this.savedById,
        this.userData});

  Data.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    description = json['description'];
    image = json['image'];
    activity = json['Activity'];
    job = json['job'];
    savedById = json['SavedById'];
    if (json['userData'] != null) {
      userData = <UserData>[];
      json['userData'].forEach((v) {
        userData!.add(new UserData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['description'] = this.description;
    data['image'] = this.image;
    data['Activity'] = this.activity;
    data['job'] = this.job;
    data['SavedById'] = this.savedById;
    if (this.userData != null) {
      data['userData'] = this.userData!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class UserData {
  String? sId;
  String? name;

  UserData({this.sId, this.name});

  UserData.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['name'] = this.name;
    return data;
  }
}
