class PostModel {
  int? length;
  bool? status;
  bool? isPaid;
  List<PostData>? postData;

  PostModel.fromJson(Map<String, dynamic> json) {
    length = json['length'];
    status = json['status'];
    isPaid = json['isPaid'];
    if (json['data'] != null) {
      postData = <PostData>[];
      json['data'].forEach((v) {
        postData!.add(new PostData.fromJson(v));
      });
    }
  }


}

class PostData {
  String? postId;
  User? userDataPost;
  String? description;
  List<String>? image;
  String? job;
  String? createdAt;
  String? updatedAt;
  String? date;
  String? id;

  PostData.fromJson(Map<String, dynamic> json) {
    postId = json['_id'];
    userDataPost = json['user'] != null ? new User.fromJson(json['user']) : null;
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
  String? sId;
  String? name;
  String? photo;
  String? role;
  String? id;
  User.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    photo = json['photo'];
    role = json['role'];
    id = json['id'];
  }
}
