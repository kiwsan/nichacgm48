import 'package:nichacgm48/models/base_model.dart';

class Profile extends BaseModel {
  String name;
  String image;

  Profile({this.name, this.image});

  Profile.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['image'] = this.image;
    return data;
  }
}
