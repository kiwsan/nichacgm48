import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:nichacgm48/models/instagram_post_model.dart';

class InstagramApiProvider {
  Future<EdgeOwnerToTimelineMedia> fetchPosts() async {
    final response =
        await http.get('https://www.instagram.com/nicha.cgm48official/?__a=1');

    if (response.statusCode == 200) {
      //var jsonString = response.body.toString();
      // If the call to the server was successful, parse the JSON.
      var responseJson = json.decode(response.body);

      var posts = EdgeOwnerToTimelineMedia.fromJson(
          responseJson['graphql']['user']['edge_owner_to_timeline_media']);

      return posts;
    } else {
      // If that call was not successful, throw an error.
      throw Exception('Failed to load post');
    }
  }
}
