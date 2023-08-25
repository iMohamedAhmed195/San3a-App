
class ProfileModel {
  bool? status;
  Data? data;
  ProfileModel({this.status, this.data});

  ProfileModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  UserData? userData;
  List<Posts>? posts;

  Data({this.userData, this.posts});

  Data.fromJson(Map<String, dynamic> json) {
    userData = json['userData'] != null
        ? new UserData.fromJson(json['userData'])
        : null;
    if (json['posts'] != null) {
      posts = <Posts>[];
      json['posts'].forEach((v) {
        posts!.add(new Posts.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.userData != null) {
      data['userData'] = this.userData!.toJson();
    }
    if (this.posts != null) {
      data['posts'] = this.posts!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class UserData {
  String? job;
  String? bio;
  String? sId;
  String? name;
  String? phone;
  String? email;
  String? photo;
  String? role;
  String? birthdate;
  String? city;
  int? rateAverage;
  String? countryCode;
  bool? isPaid;
  String? id;

  UserData(
      {this.job,
        this.bio,
        this.sId,
        this.name,
        this.phone,
        this.email,
        this.photo,
        this.role,
        this.birthdate,
        this.city,
        this.rateAverage,
        this.countryCode,
        this.isPaid,
        this.id});

  UserData.fromJson(Map<String, dynamic> json) {
    job = json['job'];
    bio = json['bio'];
    sId = json['_id'];
    name = json['name'];
    phone = json['phone'];
    email = json['email'];
    photo = json['photo'];
    role = json['role'];
    birthdate = json['birthdate'];
    city = json['city'];
    rateAverage = json['rateAverage'];
    countryCode = json['countryCode'];
    isPaid = json['isPaid'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['job'] = this.job;
    data['bio'] = this.bio;
    data['_id'] = this.sId;
    data['name'] = this.name;
    data['phone'] = this.phone;
    data['email'] = this.email;
    data['photo'] = this.photo;
    data['role'] = this.role;
    data['birthdate'] = this.birthdate;
    data['city'] = this.city;
    data['rateAverage'] = this.rateAverage;
    data['countryCode'] = this.countryCode;
    data['isPaid'] = this.isPaid;
    data['id'] = this.id;
    return data;
  }
}

class Posts {
  String? sId;
  User? user;
  String? description;
  List<String>? image;
  String? job;
  String? createdAt;
  String? updatedAt;
  String? date;
  String? id;

  Posts(
      {this.sId,
        this.user,
        this.description,
        this.image,
        this.job,
        this.createdAt,
        this.updatedAt,
        this.date,
        this.id});

  Posts.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
    description = json['description'];
    image = json['image'].cast<String>();
    job = json['job'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    date = json['Date'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    data['description'] = this.description;
    data['image'] = this.image;
    data['job'] = this.job;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['Date'] = this.date;
    data['id'] = this.id;
    return data;
  }
}

class User {
  String? sId;
  String? name;
  String? photo;
  String? role;
  String? id;

  User({this.sId, this.name, this.photo, this.role, this.id});

  User.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    photo = json['photo'];
    role = json['role'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['name'] = this.name;
    data['photo'] = this.photo;
    data['role'] = this.role;
    data['id'] = this.id;
    return data;
  }
}
