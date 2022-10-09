import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:heart_registration_app/models/user.dart';

class SecureStore{

  static final storage = new FlutterSecureStorage();

  static void storeToken(String tokenKey, String token) async{
      await storage.write(key: tokenKey, value: token);
  }

  static Future<String?> getToken(String tokenKey) async {
    return await storage.read(key:tokenKey);
  }

  static void createUser(Map userdata){
    json.encode(userdata);
    storeToken("user", jsonEncode(userdata));
  }
  static Future<Map> getUser() async{
    var userData = await getToken("user");
    Map user = jsonDecode(userData!);
    return user;
  }

  static logout() async {
    await storage.deleteAll();
  }

}