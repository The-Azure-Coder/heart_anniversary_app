import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:heart_registration_app/services/network_handler.dart';
import 'login.dart';
import '../widgets/department_reg_dropDown.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _Register();
}

class _Register extends State<Register> {
  var _departList = [];
  var chosenDep = "";
  int deptCount = 0;
  String first_name = '';
  String last_name = '';
  String email_address = '';
  String phone_number = '';
  String organization = '';
  //defaulted to test until dropdown issue is resolved
  String department = "6341594525e3e385fa19bd50";
  String error = '';

  Future<bool> register(String firstName, String lastName, String emailAddress,
      String phoneNumber, String department, String organization) async {
    //check if login

      Map registerStatus = jsonDecode(await NetworkHandler.post("/registrants", {
      "first_name": firstName,
      "last_name": lastName,
      "email_address": emailAddress,
      "phoneNumber": phoneNumber,
      "department": department,
      "organization": organization
    }));

    if (registerStatus["status"] == 201) {
      print("User created");
      print(registerStatus);
      return true;
    }
    setState(() {
      error = registerStatus["error"];
    });
    return false;
  }

  void getdepartments() async {
    try {
      final response = await NetworkHandler.get(endpoint: '/departments');
      final jsonData = jsonDecode(response)['data'];
      print(response);

      setState(() {
        _departList = jsonData;
        deptCount = _departList.length;
      });
    } catch (err) {}
  }

  @override
  void initState() {
    super.initState();

    getdepartments();
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
                  width: 370,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/images/heart_logo.png',
                        height: 100,
                      ),
                      Container(
                          margin: const EdgeInsets.only(bottom: 20),
                          width: 210,
                          child: const Text(
                            'Welcome To the HEART NSTA Registration System',
                            style: TextStyle(
                                color: Colors.white,
                                fontStyle: FontStyle.italic),
                            textAlign: TextAlign.center,
                          )),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          SizedBox(
                              width: 165,
                              child: Container(
                                decoration: BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                        color: Colors.grey.withOpacity(0.5),
                                        spreadRadius: 1,
                                        blurRadius: 1.5,
                                        offset: const Offset(0, 2))
                                  ],
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(10)),
                                  color: Colors.white,
                                ),
                                child: TextField(
                                  keyboardType: TextInputType.name,
                                  onChanged: (value) {
                                    setState(() {
                                      error = "";
                                      first_name = value;
                                    });
                                  },
                                  decoration: InputDecoration(
                                      contentPadding:
                                          const EdgeInsets.only(left: 15),
                                      border: InputBorder.none,
                                      hintText: 'First Name',
                                      hintStyle: TextStyle(
                                          color: Colors.grey.shade400)),
                                ),
                              )),
                          SizedBox(
                              width: 165,
                              child: Container(
                                decoration: BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                        color: Colors.grey.withOpacity(0.5),
                                        spreadRadius: 1,
                                        blurRadius: 1.5,
                                        offset: const Offset(0, 2))
                                  ],
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(10)),
                                  color: Colors.white,
                                ),
                                child: TextField(
                                  keyboardType: TextInputType.name,
                                  onChanged: (value) {
                                    setState(() {
                                      error = "";
                                      last_name = value;
                                    });
                                  },
                                  decoration: InputDecoration(
                                      contentPadding:
                                          const EdgeInsets.only(left: 15),
                                      border: InputBorder.none,
                                      hintText: 'Last Name',
                                      hintStyle: TextStyle(
                                          color: Colors.grey.shade400)),
                                ),
                              )),
                        ],
                      ),
                      const Padding(
                          padding: EdgeInsets.symmetric(vertical: 10)),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          SizedBox(
                              width: 165,
                              child: Container(
                                decoration: BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                        color: Colors.grey.withOpacity(0.5),
                                        spreadRadius: 1,
                                        blurRadius: 1.5,
                                        offset: const Offset(0, 2))
                                  ],
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(10)),
                                  color: Colors.white,
                                ),
                                child: TextField(
                                  keyboardType: TextInputType.emailAddress,
                                  onChanged: (value) {
                                    setState(() {
                                      error = "";
                                      email_address = value;
                                    });
                                  },
                                  decoration: InputDecoration(
                                      contentPadding:
                                          const EdgeInsets.only(left: 15),
                                      border: InputBorder.none,
                                      hintText: 'Email',
                                      hintStyle: TextStyle(
                                          color: Colors.grey.shade400)),
                                ),
                              )),
                          SizedBox(
                              width: 165,
                              child: Container(
                                decoration: BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                        color: Colors.grey.withOpacity(0.5),
                                        spreadRadius: 1,
                                        blurRadius: 1.5,
                                        offset: const Offset(0, 2))
                                  ],
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(10)),
                                  color: Colors.white,
                                ),
                                child: TextField(
                                  keyboardType: TextInputType.name,
                                  onChanged: (value) {
                                    setState(() {
                                      error = "";
                                      phone_number = value;
                                    });
                                  },
                                  decoration: InputDecoration(
                                      contentPadding:
                                          const EdgeInsets.only(left: 15),
                                      border: InputBorder.none,
                                      hintText: 'Phone No.',
                                      hintStyle: TextStyle(
                                          color: Colors.grey.shade400)),
                                ),
                              )),
                        ],
                      ),
                      const Padding(
                          padding: EdgeInsets.symmetric(vertical: 10)),
                      SizedBox(
                          width: 350,
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
                              onChanged: (value) {
                                setState(() {
                                  error = "";
                                  organization = value;
                                });
                              },
                              keyboardType: TextInputType.text,
                              decoration: InputDecoration(
                                  contentPadding:
                                      const EdgeInsets.only(left: 15),
                                  border: InputBorder.none,
                                  hintText: 'Organization',
                                  hintStyle:
                                      TextStyle(color: Colors.grey.shade400)),
                            ),
                          )),
                      Container(
                        padding: EdgeInsets.all(5),
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
                        margin: EdgeInsets.only(top: 20),
                        width: 350,
                        child: DropdownButton(
                          isExpanded: true,
                          // Initial Value
                          value: _departList[0]['_id'],

                          // Down Arrow Icon
                          icon: const Icon(Icons.keyboard_arrow_down),

                          // Array list of items
                          items: _departList.map((list) {
                            return DropdownMenuItem(
                              onTap: () {
                                setState(() {
                                  department = list["_id"];
                                  print(department);
                                });
                              },
                              value: list["_id"],
                              child: Text(list["name"]),
                            );
                          }).toList(),
                          // After selecting the desired option,it will
                          // change button value to selected value
                          onChanged: (newValue) {
                            print(newValue);
                            setState(() {
                              // dropdownvalue = newValue;
                            });
                          },
                        ),
                      ),

                      const Padding(
                          padding: EdgeInsets.symmetric(vertical: 10)),
                      //someone needs to get the value this is presenting for integration of the for submit
                      // const DropDown(),
                      const Padding(
                          padding: EdgeInsets.symmetric(vertical: 10)),
                      Container(
                        decoration: const BoxDecoration(
                            color: Colors.blue,
                            borderRadius:
                                BorderRadius.all(Radius.circular(10))),
                        padding: const EdgeInsets.symmetric(
                          vertical: 10,
                          horizontal: 140,
                        ),
                        child: SizedBox(
                          height: 35,
                          child: TextButton(
                            onPressed: () async {
                              if (await register(
                                  first_name,
                                  last_name,
                                  email_address,
                                  phone_number,
                                  department,
                                  organization)) {
                                Navigator.pop(context);
                              }
                              
                            },
                            child: const Text(
                              'REGISTER',
                              style: TextStyle(color: Colors.white),
                              textAlign: TextAlign.center,
                            ),
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
                  height: 60,
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
