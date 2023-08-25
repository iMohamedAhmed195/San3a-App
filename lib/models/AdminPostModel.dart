class AdminPostModel {
  int? length;
  bool? status;
  String? message;
  List<Date>? date;

  AdminPostModel({this.length, this.status, this.message, this.date});

  AdminPostModel.fromJson(Map<String, dynamic> json) {
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
  PostId? postId;
  UserId? userId;
  String? description;
  String? reportedAt;
  int? iV;

  Date(
      {this.sId,
        this.postId,
        this.userId,
        this.description,
        this.reportedAt,
        this.iV});

  Date.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    postId =
    json['postId'] != null ? new PostId.fromJson(json['postId']) : null;
    userId =
    json['userId'] != null ? new UserId.fromJson(json['userId']) : null;
    description = json['description'];
    reportedAt = json['reportedAt'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    if (this.postId != null) {
      data['postId'] = this.postId!.toJson();
    }
    if (this.userId != null) {
      data['userId'] = this.userId!.toJson();
    }
    data['description'] = this.description;
    data['reportedAt'] = this.reportedAt;
    data['__v'] = this.iV;
    return data;
  }
}

class PostId {
  String? sId;
  User? user;
  String? description;
  List<String>? image;
  String? job;
  String? createdAt;
  String? date;
  String? id;

  PostId(
      {this.sId,
        this.user,
        this.description,
        this.image,
        this.job,
        this.createdAt,
        this.date,
        this.id});

  PostId.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
    description = json['description'];
    image = json['image'].cast<String>();
    job = json['job'];
    createdAt = json['createdAt'];
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

class UserId {
  String? sId;
  String? name;
  String? email;
  String? id;

  UserId({this.sId, this.name, this.email, this.id});

  UserId.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    email = json['email'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['name'] = this.name;
    data['email'] = this.email;
    data['id'] = this.id;
    return data;
  }
}