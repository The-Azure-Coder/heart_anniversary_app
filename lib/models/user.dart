import 'package:http/http.dart' as http;
import 'dart:convert';
class User {
  final Uri ENDPOINT = Uri(
    scheme: "https",
    host:"heart-registration-app.vercel.app",
    path: "/api/v1/"
  );
  String _id = "";
  String fname = "";
  String lname = "";
  String email = "";
  String password = "";
  bool isSuperAdmin = false;

  Future<Map> login(String email, String password) async {
    Uri LOGINURI = Uri.http("192.168.8.191:3000","/api/v1/authenticate");
    http.Response userData = await http.post(LOGINURI, body:{"email":email, "password":password});
    Map decodedData = jsonDecode(userData.body);
    return decodedData;
  }


}