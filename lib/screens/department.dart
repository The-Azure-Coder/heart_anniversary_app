import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:heart_registration_app/widgets/admin_drawer.dart';

import '../services/network_handler.dart';

class DepartmentPage extends StatefulWidget {
  const DepartmentPage({super.key});

  @override
  State<DepartmentPage> createState() => _DepartmentPageState();
}

class _DepartmentPageState extends State<DepartmentPage> {
  var _departList = [];
  String name = '';
  String error = '';
  Future<bool> CreateDepartment(String department) async {
    print(department);

    Map departmentStatus =
        jsonDecode(await NetworkHandler.post("/departments", {
      "name": name,
    }));
    print(departmentStatus);
    if (departmentStatus["status"] == 201) {
      print("department created");
      print(departmentStatus);
      return true;
    }

    setState(() {
      error = departmentStatus["error"];
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
      });
    } catch (err) {}
  }

  void deleteDepartment({String departID = ''}) async {
    try {
      final response = await NetworkHandler.delete('/departments/$departID');
      final jsonData = jsonDecode(response)['data'];
      print(departID);
      print(response);
      print('deleted successfully');

      setState(() {});
    } catch (err) {}
  }

  void editDepartment({Map<String, dynamic> department = const {}}) async {
    showDepartmentFields(department: department);
  }

  @override
  void initState() {
    super.initState();
    getdepartments();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
        backgroundColor: Colors.white,
        drawer: const AdminDrawer(),
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(160),
          child: AppBar(
            titleSpacing: 0,
            elevation: 0.0,
            title: const Text(
              'Department Page',
              style: TextStyle(color: Colors.white),
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
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
          padding: const EdgeInsets.all(15),
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Departments',
                    style: TextStyle(
                        color: Color.fromARGB(255, 153, 153, 153),
                        fontSize: 16,
                        fontWeight: FontWeight.w600)),
                Container(
                  width: 150,
                  height: 45,
                  decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(10)),
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
            ListView.builder(
              shrinkWrap: true,
              physics: const ScrollPhysics(),
              itemCount: _departList.length,
              itemBuilder: (context, i) {
                final department = _departList[i];
                return Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(7),
                      child: Stack(
                        children: [
                          Card(
                            child: ListTile(
                                title: Text("${department['name']}"),
                                leading: const Icon(
                                  Icons.star_sharp,
                                  color: Colors.amber,
                                ),
                                trailing: PopupMenuButton(
                                  itemBuilder: (context) {
                                    return [
                                      PopupMenuItem(
                                        value: 'edit',
                                        child: TextButton(
                                            onPressed: () {
                                              editDepartment(
                                                  department: department);
                                            },
                                            child: const Text('Edit')),
                                      ),
                                      PopupMenuItem(
                                        value: 'delete',
                                        child: TextButton(
                                            onPressed: () {
                                              deleteDepartment(
                                                  departID: department['_id']);
                                              getdepartments();
                                            },
                                            child: const Text('Delete')),
                                      )
                                    ];
                                  },
                                  onSelected: (String value) {},
                                )),
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
              showDepartmentFields();
            },
            child: const Icon(Icons.add)));
  }

  PopupMenuItem _buildPopupMenuItem(String title) {
    return PopupMenuItem(
      child: Text(title),
    );
  }

  void showDepartmentFields({Map<String, dynamic> department = const {}}) {
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
                const Text(
                  'Add Department',
                  textAlign: TextAlign.center,
                ),
              ],
            ),
            content: Padding(
              padding: const EdgeInsets.all(0.0),
              child: Form(
                child: Column(
                  children: <Widget>[
                    SizedBox(
                        width: 300,
                        child: TextFormField(
                          keyboardType: TextInputType.name,
                          initialValue: department['name'],
                          onChanged: (value) {
                            setState(() {
                              error = "";
                              name = value;
                            });
                          },
                          decoration: const InputDecoration(
                            labelText: 'Department',
                          ),
                        )),
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
                  if (await CreateDepartment(name)) {
                    print('here');
                    Navigator.pop(context);
                    getdepartments();
                  }
                },
                child: const Text('Add Department'),
              ),
            ],
          );
        });
  }
}
