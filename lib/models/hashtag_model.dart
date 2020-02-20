import 'package:nichacgm48/models/base_model.dart';

class Hashtag extends BaseModel {
  int id;
  String hashtag;

  Hashtag({this.id, this.hashtag});

  Hashtag.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    hashtag = json['hashtag'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['hashtag'] = this.hashtag;
    return data;
  }
}

class HashTags extends BaseModel {
  List<Hashtag> hashtags;

  HashTags({this.hashtags});

  HashTags.fromJson(Map<String, dynamic> json) {
    if (json['hashtags'] != null) {
      hashtags = new List<Hashtag>();
      json['hashtags'].forEach((v) {
        hashtags.add(new Hashtag.fromJson(v));
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
