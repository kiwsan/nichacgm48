import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:nichacgm48/models/profile_model.dart';

class ProfileApiProvider {
  Future<Profile> fetchProfile() async {
    final response = await http
        .get('https://my-json-server.typicode.com/kiwsan/nichacgm48/profile');

    if (response.statusCode == 200) {
      // If the call to the server was successful, parse the JSON.
      var responseJson = json.decode(response.body);

      var profile = Profile.fromJson(responseJson);

      return profile;
    } else {
      // If that call was not successful, throw an error.
      throw Exception('Failed to load profile');
    }
  }
}
