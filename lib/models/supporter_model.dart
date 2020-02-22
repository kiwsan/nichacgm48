import 'package:nichacgm48/models/base_model.dart';

class Supporters extends BaseModel {
  List<Supporter> supporters;

  Supporters({this.supporters});

  Supporters.fromJson(Map<String, dynamic> json) {
    if (json['supporters'] != null) {
      supporters = new List<Supporter>();
      json['supporters'].forEach((v) {
        supporters.add(new Supporter.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();

    if (this.supporters != null) {
      data['supporters'] = this.supporters.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Supporter extends BaseModel {
  int id;
  String image;
  String social;
  String url;

  Supporter({this.id, this.image, this.social, this.url});

  Supporter.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    image = json['image'];
    social = json['social'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['image'] = this.image;
    data['social'] = this.social;
    data['url'] = this.url;
    return data;
  }
}
