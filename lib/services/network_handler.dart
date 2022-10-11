import 'dart:convert';

import 'package:heart_registration_app/services/secure_store.dart';
import 'package:http/http.dart' as http;

class NetworkHandler {
  static String token = "";
  NetworkHandler() {
    getToken();
  }

  static Future<String> getToken() async {
    var authToken = (await SecureStore.getToken("jwt-auth"))!;
    return authToken;
  }

  static final client = http.Client();

  static Future<String> post(String endpoint, var body) async {
    var response = await client.post(buildUrl(segment: endpoint),
        body: jsonEncode(body),
        headers: {
          "Content-type": "application/json",
          "Authorization": "Bearer $token"
        });
    return response.body;
  }

  static Future<String> get(
      {String endpoint = "", Object queryParams = const {}}) async {
    token = await getToken();
    var response = await client.get(buildUrl(segment: endpoint), headers: {
      "Content-type": "application/json",
      "Authorization": "Bearer $token"
    });

    return response.body;
  }

  static Future<String> patch(String endpoint, var changes) async {
    var response = await client.patch(buildUrl(segment: endpoint),
        body: changes,
        headers: {
          "Content-type": "application/json",
          "Authorization": "Bearer $token"
        });

    return response.body;
  }

  static Future<String> delete(String endpoint) async {
    var response = await client.delete(buildUrl(segment: endpoint), headers: {
      "Content-type": "application/json",
      "Authorization": "Bearer $token"
    });
    print(response.body);
    return response.body;
  }

  static buildUrl({String segment = "", queryParams = const {}}) {
    Uri uri = Uri(
      scheme: "https",
      host: "heart40.herokuapp.com",
      path: "/api/v1$segment",
      // queryParameters: queryParams
    );

    return uri;
  }
}
