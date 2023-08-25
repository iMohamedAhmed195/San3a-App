class WorkerSendUser {
  bool? status;
  late Data data;

  WorkerSendUser.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    data = json['data'];
  }


}

class Data {
  late  UserData userData;
  List<Posts>? posts;


  Data.fromJson(Map<String, dynamic> json) {
    userData = json['userData'];
    if (json['posts'] != null) {
      posts = <Posts>[];
      json['posts'].forEach((v) {
        posts!.add( Posts.fromJson(v));
      });
    }
  }


}

class UserData {

  late String name;
  late String photo;
  late String role;
  late String city;
  late int rateAverage;
  late String countryCode;
  late String id;


  UserData.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    photo = json['photo'];
    role = json['role'];
    city = json['city'];
    rateAverage = json['rateAverage'];
    countryCode = json['countryCode'];
    id = json['id'];
  }


}

class Posts {
  late User user;
  String? description;
  List<String>? image;
  String? job;
  String? createdAt;
  String? updatedAt;
  String? date;
  String? id;

  Posts.fromJson(Map<String, dynamic> json) {
    user = json['user'] ;
    description = json['description'];
    image = json['image'].cast<String>();
    job = json['job'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    date = json['Date'];
    id = json['id'];
  }

}

class User {
  late String name;
  late String photo;
  late String role;
  late String id;

  User.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    photo = json['photo'];
    role = json['role'];
    id = json['id'];
  }

}
