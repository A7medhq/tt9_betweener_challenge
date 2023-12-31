class LinkResponseModel {
  List<Link>? links;

  LinkResponseModel({this.links});

  LinkResponseModel.fromJson(Map<String, dynamic> json) {
    if (json['links'] != null) {
      links = <Link>[];
      json['links'].forEach((v) {
        links!.add(new Link.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.links != null) {
      data['links'] = this.links!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Link {
  int? id;
  String? title;
  String? link;
  String? username;
  String? isActive;
  String? userId;
  String? createdAt;
  String? updatedAt;

  Link(
      {this.id,
      this.title,
      this.link,
      this.username,
      this.isActive,
      this.userId,
      this.createdAt,
      this.updatedAt});

  Link.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    link = json['link'];
    username = json['username'];
    isActive = json['isActive'];
    userId = json['user_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['link'] = this.link;
    data['username'] = this.username;
    data['isActive'] = this.isActive;
    data['user_id'] = this.userId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
