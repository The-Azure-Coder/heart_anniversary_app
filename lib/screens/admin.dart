import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:heart_registration_app/screens/login.dart';
import 'package:heart_registration_app/services/network_handler.dart';
import 'package:heart_registration_app/services/secure_store.dart';
import 'package:heart_registration_app/widgets/admin_drawer.dart';
import 'package:heart_registration_app/widgets/dropdown.dart';

class AdminPage extends StatefulWidget {
  const AdminPage({super.key});

  @override
  State<AdminPage> createState() => _AdminPageState();
}

class _AdminPageState extends State<AdminPage> {
  var _usersList = [];
  var _registrantsList = [];
  var _departList = [];
  var chosenDep = "";
  int userCount = 0;
  int regCount = 0;
  int deptCount = 0;
  String fname = '';
  String lname = '';
  String email = '';
  String password = '';

  //defaulted to test until dropdown issue is resolved
  String department = "6341594525e3e385fa19bd50";
  String error = '';

  Future<bool> register(String fname, String lname, String email,String department) async {
    //check if login
    print(fname);
    print(lname);
    print(email);
    print(department);

    Map registerStatus = jsonDecode(await NetworkHandler.post("/users", {
      "fname": fname,
      "lname": lname,
      "email": email,
      "department": department,
    }));
    print(registerStatus);
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
  Future<bool> updateUser(String user_id, Object updateBody) async {

    Map updateStatus = jsonDecode(await NetworkHandler.post("/users/$user_id", updateBody));
    print(updateStatus);
    if (updateStatus["status"] == 201) {
      print("User created");
      print(updateStatus);
      return true;
    }

    setState(() {
      error = updateStatus["error"];
    });
    return false;
  }


  void getUsers() async {
    try {
      final response = await NetworkHandler.get(endpoint: '/users');
      final jsonData = jsonDecode(response)['data'];
      print(response);

      setState(() {
        _usersList = jsonData;
        userCount = _usersList.length;
      });
    } catch (err) {}
  }

  void getRegistrants() async {
    try {
      final response = await NetworkHandler.get(endpoint: '/registrants');
      final jsonData = jsonDecode(response)['data'];
      print(response);

      setState(() {
        _registrantsList = jsonData;
        regCount = _registrantsList.length;
      });
    } catch (err) {}
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

  void logOut() {
    SecureStore.logout();
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => const Login()));
  }

  void deleteUser({String userID = ''}) async {
    try {
      final response = await NetworkHandler.delete('/users/$userID');
      print('deleted successfully');
      _registrantsList.retainWhere((user) => user['id'] == userID);
      setState(() {});
    } catch (err) {
      print(err);
    }
  }

  void editUser(Map<String, dynamic> user) async {
    showDialogWithFields(user: user, operation: "UPDATE");
  }

  @override
  void initState() {
    super.initState();
    getUsers();
    getdepartments();
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Scaffold(
        drawer: const AdminDrawer(),
        floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
        backgroundColor: Colors.white,
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(160),
          child: AppBar(
            titleSpacing: 0,
            elevation: 0.0,
            title: const Text(
              'Admin Pannel',
              style: TextStyle(color: Colors.white),
            ),
            actions: [
              TextButton(
                onPressed: () {
                  logOut();
                },
                child: const Text('Log Out',
                    style: TextStyle(
                        fontSize: 17.0,
                        color: Colors.white,
                        fontWeight: FontWeight.w700)),
              ),
            ],
            flexibleSpace: Stack(
              children: [
                Container(
                  alignment: Alignment.topLeft,
                  margin: const EdgeInsets.only(top: 100, left: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text('Hello Admin',
                          textAlign: TextAlign.start,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.w700)),
                      Padding(
                        padding: EdgeInsets.only(top: 12.0),
                        child: SizedBox(
                          width: 170,
                          child: Text('Welcome to Heart 40th Aniversary ',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 14)),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        body: ListView(
          children: [
            const Padding(
              padding: EdgeInsets.only(top: 10, bottom: 6, left: 11),
              child: Text(
                'Dashboard',
                style:
                    TextStyle(color: Colors.grey, fontWeight: FontWeight.w500),
              ),
            ),
            Wrap(
              alignment: WrapAlignment.center,
              children: [
                SizedBox(
                  width: 122,
                  child: Card(
                    child: ListTile(
                      horizontalTitleGap: 8,
                      leading: const CircleAvatar(
                        backgroundColor: Colors.blue,
                        child: Icon(
                          Icons.people,
                          color: Colors.white,
                        ),
                      ),
                      title: Text(
                        '$userCount',
                        style: const TextStyle(
                          fontWeight: FontWeight.w600,
                          color: Colors.blue,
                        ),
                      ),
                      subtitle: const Text('Users'),
                    ),
                  ),
                ),
                SizedBox(
                  width: 122,
                  child: Card(
                    child: ListTile(
                      horizontalTitleGap: 8,
                      leading: const CircleAvatar(
                        backgroundColor: Color.fromARGB(255, 250, 81, 137),
                        child: Icon(
                          Icons.business_center,
                          color: Colors.white,
                        ),
                      ),
                      title: Text(
                        '$deptCount',
                        style: const TextStyle(
                          fontWeight: FontWeight.w600,
                          color: Color.fromARGB(255, 250, 81, 137),
                        ),
                      ),
                      subtitle: const Text('Depts'),
                    ),
                  ),
                ),
                SizedBox(
                  width: 128,
                  child: Card(
                    child: ListTile(
                      horizontalTitleGap: 8,
                      leading: const CircleAvatar(
                        backgroundColor: Color.fromARGB(255, 11, 247, 232),
                        child: Icon(
                          Icons.business,
                          color: Colors.white,
                        ),
                      ),
                      title: Text(
                        '$regCount',
                        style: const TextStyle(
                          fontWeight: FontWeight.w600,
                          color: Color.fromARGB(255, 11, 247, 232),
                        ),
                      ),
                      subtitle: const Text('regs'),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 12,
                ),
              ],
            ),
            const SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('User Lists ',
                      style: TextStyle(
                          color: Colors.grey, fontWeight: FontWeight.w500)),
                  Container(
                    width: 150,
                    height: 45,
                    decoration: BoxDecoration(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(5)),
                        border: Border.all(
                            color: const Color.fromARGB(255, 231, 229, 229))),
                    child: const Expanded(
                        child: TextField(
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'search..',
                        hintStyle: TextStyle(color: Colors.grey),
                        contentPadding: EdgeInsets.all(0.0),
                        prefixIcon: Icon(
                          Icons.search,
                          color: Colors.grey,
                          size: 20,
                        ),
                        prefixIconConstraints:
                            BoxConstraints(maxHeight: 20, minWidth: 25),
                      ),
                    )),
                  )
                ],
              ),
            ),
            ListView.builder(
              shrinkWrap: true,
              physics: const ScrollPhysics(),
              itemCount: _usersList.length,
              itemBuilder: (context, i) {
                final user = _usersList[i];
                return Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(7),
                      child: Stack(
                        children: [
                          Card(
                            child: ListTile(
                                title: Text("${user['fname']}"),
                                subtitle: (user['department'] != null)
                                    ? Text("${user['department']['name']}")
                                    : Text("Admin"),
                                trailing: PopupMenuButton(
                                  itemBuilder: (context) {
                                    return [
                                      PopupMenuItem(
                                        value: 'edit',
                                        child: TextButton(
                                            onPressed: () {
                                              editUser(user);
                                            },
                                            child: const Text('Edit')),
                                      ),
                                      PopupMenuItem(
                                        value: 'delete',
                                        child: TextButton(
                                            onPressed: () {
                                              deleteUser(userID: user['_id']);
                                              getUsers();
                                            },
                                            child: const Text('Delete')),
                                      )
                                    ];
                                  },
                                  onSelected: (String value) {},
                                )),
                          ),
                          Container(
                            color: const Color.fromARGB(255, 255, 59, 222),
                            height: 77,
                            width: 10,
                          ),
                        ],
                      ),
                    ),
                  ],
                );
              },
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
            onPressed: () {
              showDialogWithFields(operation:"CREATE");
            },
            child: const Icon(Icons.add)));
  }

  void showDialogWithFields({Map<String, dynamic> user = const {}, operation: ""}) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            scrollable: true,
            title: Column(
              children: [
                Image.asset(
                  'assets/images/heart_logo.png',
                  width: 60,
                  height: 60,
                  fit: BoxFit.contain,
                ),
                const Text("Update User",
                  textAlign: TextAlign.center,
                ),
              ],
            ),
            content: Padding(
              padding: const EdgeInsets.all(0.0),
              child: Form(
                child: Column(
                  children: <Widget>[
                    Row(children: <Widget>[
                      SizedBox(
                        width: 120,
                        child: TextFormField(
                          keyboardType: TextInputType.name,
                          initialValue: findAltText(
                              model: user, fieldName: "fname", altText: " "),
                          onChanged: (value) {
                            setState(() {
                              error = "";
                              fname = value;
                            });
                          },
                          decoration: const InputDecoration(
                            labelText: 'First Name',
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                      SizedBox(
                        width: 120,
                        child: TextFormField(
                          keyboardType: TextInputType.name,
                          initialValue: findAltText(
                              model: user, fieldName: "lname", altText: " "),
                          onChanged: (value) {
                            setState(() {
                              error = "";
                              lname = value;
                            });
                          },
                          decoration: const InputDecoration(
                            labelText: 'Last Name',
                          ),
                        ),
                      ),
                    ]),
                    Row(

                        children: <Widget>[

                      SizedBox(

                        width: 240,
                        child: TextFormField(
                          keyboardType: TextInputType.emailAddress,
                          initialValue: findAltText(
                              model: user, fieldName: "email", altText: " "),
                          onChanged: (value) {
                            setState(() {
                              error = "";
                              email = value;
                            });
                          },
                          decoration: const InputDecoration(
                            labelText: 'Email',
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                    ]),
                    const SizedBox(
                      height: 15,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(bottom: 8.0),
                          child: Text('Department',
                              style: TextStyle(
                                color: Color.fromARGB(255, 119, 119, 119),
                              )),
                        ),
                        SizedBox(
                          width: 300,
                          child: DropdownButton(
                            // isExpanded: true,
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
                      ],
                    ),
                    const SizedBox(
                      height: 19,
                    ),
                  ],
                ),
              ),
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('Cancel'),
              ),
              TextButton(
                onPressed: () async {
                  if(operation == "CREATE"){
                    if(await register(fname, lname, email, department)){
                      Navigator.pop(context);
                      getUsers();
                    }
                  }else if(operation == "UPDATE"){
                    await updateUser(user["_id"],{fname, lname, email, department});
                    Navigator.pop(context);
                    getUsers();
                  }

                },
                child: const Text('Update User'),
              ),
            ],
          );
        });
  }
}

String findAltText(
    {Map<String, dynamic> model = const {},
    String fieldName = "",
    String altText = "Alt Text"}) {
  if (model[fieldName] == null) {
    return altText;
  }
  return model[fieldName];
}
