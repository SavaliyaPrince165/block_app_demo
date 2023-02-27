import 'dart:convert';

import 'package:block_app_demo/data/core/api_constants.dart';
import 'package:http/http.dart';

class ApiClient {
  final Client _client;
  ApiClient(this._client);

  dynamic get(String path) async {
    final response = await _client.get(
      Uri.parse("${ApiConstants.BASE_URL}movie/popular?api_key=${ApiConstants.API_KEY}"),
      headers: Map<String, String>.from(
        {
          "Content-Type": "application/json",
        },
      ),
    );

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception(response.reasonPhrase);
    }
  }
}
