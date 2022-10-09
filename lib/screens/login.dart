import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:heart_registration_app/screens/admin.dart';
import 'package:heart_registration_app/services/network_handler.dart';
import 'guest_list.dart';
import '../services/secure_store.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _Login();
}

class _Login extends State<Login> {
  String password = '';
  String email = '';
  String error = '';

  Future<String> submitForm(String email, String password) async {
    Map userData = jsonDecode(await NetworkHandler.post(
        "/authenticate", {"email": email, "password": password}));
    if (userData["status"] == 200) {
      SecureStore.storeToken("jwt-auth", userData["data"]["token"]);
      SecureStore.createUser(userData["data"]["user"]);
      print(userData["data"]["user"]["isSuperAdmin"]);
      if (userData["data"]["user"]["isSuperAdmin"]) {
        return "ADMIN";
      } else {
        return "USER";
      }
    }
    setState(() {
      error = userData["error"];
    });
    return "NULL";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          alignment: Alignment.center,
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image:
                      AssetImage('assets/images/blur_login_Background_V2.jpg'),
                  fit: BoxFit.cover)),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 120,
                ),
                Container(
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 2,
                          blurRadius: 0.5,
                          offset: const Offset(0, 2))
                    ],
                    borderRadius: const BorderRadius.all(Radius.circular(20)),
                    color: Colors.white.withOpacity(0.6),
                  ),
                  width: 360,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/images/heart_logo.png',
                        height: 90,
                      ),
                      const Text(
                        'Hello Again!',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 3),
                      ),
                      Container(
                          margin: const EdgeInsets.only(top: 10),
                          width: 210,
                          child: const Text(
                            "Welcome back you've been missed!",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontStyle: FontStyle.italic),
                            textAlign: TextAlign.center,
                          )),
                      const Padding(padding: EdgeInsets.symmetric(vertical: 2)),
                      Container(
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          child: Text(
                            error,
                            style: const TextStyle(color: Colors.red),
                          )),
                      SizedBox(
                          width: 280,
                          child: Container(
                            decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.grey.withOpacity(0.5),
                                    spreadRadius: 1,
                                    blurRadius: 1.5,
                                    offset: const Offset(0, 2))
                              ],
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(10)),
                              color: Colors.white,
                            ),
                            child: TextField(
                              keyboardType: TextInputType.emailAddress,
                              onChanged: (value) {
                                setState(() {
                                  error = "";
                                  email = value;
                                });
                              },
                              decoration: InputDecoration(
                                  contentPadding:
                                      const EdgeInsets.only(left: 15),
                                  border: InputBorder.none,
                                  hintText: 'Email',
                                  hintStyle:
                                      TextStyle(color: Colors.grey.shade400)),
                            ),
                          )),
                      const Padding(
                          padding: EdgeInsets.symmetric(vertical: 10)),
                      SizedBox(
                          width: 280,
                          child: Container(
                            decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.grey.withOpacity(0.5),
                                    spreadRadius: 1,
                                    blurRadius: 1.5,
                                    offset: const Offset(0, 2))
                              ],
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(10)),
                              color: Colors.white,
                            ),
                            child: TextField(
                              obscureText: true,
                              onChanged: (value) {
                                setState(() {
                                  error = "";
                                  password = value;
                                });
                              },
                              decoration: InputDecoration(
                                  contentPadding:
                                      const EdgeInsets.only(left: 15),
                                  border: InputBorder.none,
                                  hintText: 'Password',
                                  hintStyle:
                                      TextStyle(color: Colors.grey.shade400)),
                            ),
                          )),
                      const Padding(
                          padding: EdgeInsets.symmetric(vertical: 15)),
                      Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 0, horizontal: 15.0),
                          child: SizedBox(
                            width: 280,
                            child: TextButton(
                              onPressed: () async {
                                String usertype =
                                    await submitForm(email, password);
                                if (usertype != "NULL") {
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const GuestList()),
                                  );
                                }
                              },
                              style: TextButton.styleFrom(
                                backgroundColor: Colors.blue,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                minimumSize: const Size.fromHeight(50.0),
                              ),
                              child: const Text(
                                'LOGIN',
                                style: TextStyle(color: Colors.white),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          )),
                      const Padding(
                          padding: EdgeInsets.symmetric(vertical: 10)),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 0, horizontal: 15.0),
                        child: TextButton(
                          onPressed: () async {
                            String usertype = await submitForm(email, password);
                            if (usertype != "NULL") {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => (usertype == "ADMIN")
                                      ? const AdminPage()
                                      : const GuestList(),
                                ),
                              );
                            }
                          },
                          style: TextButton.styleFrom(
                            backgroundColor: Colors.blue,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            minimumSize: const Size.fromHeight(50.0),
                          ),
                          child: const Text(
                            'LOGIN',
                            style: TextStyle(color: Colors.white),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                      const Padding(
                          padding: EdgeInsets.symmetric(vertical: 10)),
                      const Padding(
                          padding: EdgeInsets.symmetric(vertical: 20)),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 120,
                ),
                const Text(
                  'Designed by:',
                  style: TextStyle(
                      fontSize: 15,
                      color: Colors.white,
                      fontWeight: FontWeight.w600),
                ),
                const Text(
                  'AMBERHEART Institute of Coding -Cohort 2',
                  style: TextStyle(
                      fontSize: 15,
                      color: Colors.white,
                      fontWeight: FontWeight.w600),
                )
              ],
            ),
          )),
    );
  }
}
