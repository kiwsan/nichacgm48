import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:nichacgm48/models/supporter_model.dart';

class SupporterApiProvider{
  Future<Supporters> fetchSupporters() async {
    final response = await http
        .get('https://my-json-server.typicode.com/kiwsan/nichacgm48/db');

    if (response.statusCode == 200) {
      // If the call to the server was successful, parse the JSON.
      var responseJson = json.decode(response.body);

      var supporters = Supporters.fromJson(responseJson);

      return supporters;
    } else {
      // If that call was not successful, throw an error.
      throw Exception('Failed to load supporters');
    }
  }
}