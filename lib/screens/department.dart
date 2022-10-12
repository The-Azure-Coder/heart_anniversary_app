import 'package:flutter/material.dart';
import 'package:heart_registration_app/widgets/admin_drawer.dart';

import '../widgets/dropdown.dart';

class DepartmentPage extends StatefulWidget {
  const DepartmentPage({super.key});

  @override
  State<DepartmentPage> createState() => _DepartmentPageState();
}

class _DepartmentPageState extends State<DepartmentPage> {
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
            Container(
              margin: const EdgeInsets.only(bottom: 10, top: 10),
              child: Stack(
                children: [
                  SizedBox(
                    height: 80,
                    child: Card(
                      child: ListTile(
                          title: const Text('Customer service'),
                          trailing: PopupMenuButton(
                            itemBuilder: (context) {
                              return [
                                const PopupMenuItem(
                                  value: 'edit',
                                  child: Text('Edit'),
                                ),
                                const PopupMenuItem(
                                  value: 'delete',
                                  child: Text('Delete'),
                                )
                              ];
                            },
                            onSelected: (String value) {},
                          )),
                    ),
                  ),
                  Container(
                    color: const Color.fromARGB(255, 203, 28, 252),
                    height: 77,
                    width: 10,
                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.only(bottom: 10, top: 10),
              child: Stack(
                children: [
                  SizedBox(
                    height: 80,
                    child: Card(
                      child: ListTile(
                          title: const Text('Adminstrative Assistant'),
                          trailing: PopupMenuButton(
                            itemBuilder: (context) {
                              return [
                                const PopupMenuItem(
                                  value: 'edit',
                                  child: Text('Edit'),
                                ),
                                const PopupMenuItem(
                                  value: 'delete',
                                  child: Text('Delete'),
                                )
                              ];
                            },
                            onSelected: (String value) {},
                          )),
                    ),
                  ),
                  Container(
                    color: const Color.fromARGB(255, 230, 252, 28),
                    height: 77,
                    width: 10,
                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.only(bottom: 10, top: 10),
              child: Stack(
                children: [
                  SizedBox(
                    height: 80,
                    child: Card(
                      child: ListTile(
                          title: const Text('Networking'),
                          trailing: PopupMenuButton(
                            itemBuilder: (context) {
                              return [
                                const PopupMenuItem(
                                  value: 'edit',
                                  child: Text('Edit'),
                                ),
                                const PopupMenuItem(
                                  value: 'delete',
                                  child: Text('Delete'),
                                )
                              ];
                            },
                            onSelected: (String value) {},
                          )),
                    ),
                  ),
                  Container(
                    color: const Color.fromARGB(255, 0, 160, 141),
                    height: 77,
                    width: 10,
                  ),
                ],
              ),
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

  void showDepartmentFields() {
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
                  children:  <Widget>[
                    // SizedBox(width: 300, child: DropDown(list:[])),
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
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('Add Department'),
              ),
            ],
          );
        });
  }
}
