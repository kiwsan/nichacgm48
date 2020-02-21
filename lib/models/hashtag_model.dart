import 'package:nichacgm48/models/base_model.dart';

class HashTag extends BaseModel {
  int id;
  String title;
  String hashtag;

  HashTag({this.id, this.title, this.hashtag});

  HashTag.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    hashtag = json['hashtag'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['hashtag'] = this.hashtag;
    return data;
  }
}

class HashTags extends BaseModel {
  List<HashTag> hashtags;

  HashTags({this.hashtags});

  HashTags.fromJson(Map<String, dynamic> json) {
    if (json['hashtags'] != null) {
      hashtags = new List<HashTag>();
      json['hashtags'].forEach((v) {
        hashtags.add(new HashTag.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.hashtags != null) {
      data['hashtags'] = this.hashtags.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
