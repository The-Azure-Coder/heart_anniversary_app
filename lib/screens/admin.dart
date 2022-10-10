import 'package:flutter/material.dart';
import 'package:heart_registration_app/widgets/admin_drawer.dart';
import 'package:heart_registration_app/widgets/dropdown.dart';
import 'dart:convert';
import 'package:heart_registration_app/services/network_handler.dart';

class AdminPage extends StatefulWidget {
  const AdminPage({super.key});

  @override
  State<AdminPage> createState() => _AdminPageState();
}

class _AdminPageState extends State<AdminPage> {
  



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
          children: [
            const Padding(
              padding: EdgeInsets.only(top: 10, bottom: 10, left: 11),
              child: Text(
                'Dashboard',
                style:
                    TextStyle(color: Colors.grey, fontWeight: FontWeight.w500),
              ),
            ),
            Wrap(
              alignment: WrapAlignment.center,
              children: const [
                SizedBox(
                  width: 122,
                  child: Card(
                    child: ListTile(
                      horizontalTitleGap: 8,
                      leading: CircleAvatar(
                        backgroundColor: Colors.blue,
                        child: Icon(
                          Icons.people,
                          color: Colors.white,
                        ),
                      ),
                      title: Text(
                        '130',
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          color: Colors.blue,
                        ),
                      ),
                      subtitle: Text('Users'),
                    ),
                  ),
                ),
                SizedBox(
                  width: 122,
                  child: Card(
                    child: ListTile(
                      horizontalTitleGap: 8,
                      leading: CircleAvatar(
                        backgroundColor: Color.fromARGB(255, 250, 81, 137),
                        child: Icon(
                          Icons.business_center,
                          color: Colors.white,
                        ),
                      ),
                      title: Text(
                        '12',
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          color: Color.fromARGB(255, 250, 81, 137),
                        ),
                      ),
                      subtitle: Text('Depts'),
                    ),
                  ),
                ),
                SizedBox(
                  width: 120,
                  child: Card(
                    child: ListTile(
                      horizontalTitleGap: 8,
                      leading: CircleAvatar(
                        backgroundColor: Color.fromARGB(255, 11, 247, 232),
                        child: Icon(
                          Icons.business,
                          color: Colors.white,
                        ),
                      ),
                      title: Text(
                        '8',
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          color: Color.fromARGB(255, 11, 247, 232),
                        ),
                      ),
                      subtitle: Text('Orgs'),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 12,
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
            Container(
              padding: const EdgeInsets.all(7),
              child: Stack(
                children: [
                  Card(
                    child: ListTile(
                        title: const Text('Moris Miller'),
                        subtitle: const Text('Montego Bay, Food & Beverage'),
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
                  Container(
                    color: const Color.fromARGB(255, 255, 59, 222),
                    height: 77,
                    width: 10,
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.all(7),
              child: Stack(
                children: [
                  Card(
                    child: ListTile(
                        title: const Text('Shseen Cameron'),
                        subtitle:
                            const Text('Clarendon, Amber institue of coding'),
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
                  Container(
                    color: const Color.fromARGB(255, 230, 252, 28),
                    height: 77,
                    width: 10,
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.all(7),
              child: Stack(
                children: [
                  Card(
                    child: ListTile(
                        title: const Text('Tyrese Morgan'),
                        subtitle:
                            const Text('Stony hill, Amber institue of coding'),
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
              showDialogWithFields();
            },
            child: const Icon(Icons.add)));
  }

  void showDialogWithFields() {
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
                  'Create User',
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
                          decoration: const InputDecoration(
                            labelText: 'Last Name',
                          ),
                        ),
                      ),
                    ]),
                    Row(children: <Widget>[
                      SizedBox(
                        width: 120,
                        child: TextFormField(
                          decoration: const InputDecoration(
                            labelText: 'Email',
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                      SizedBox(
                        width: 120,
                        child: TextFormField(
                          decoration: const InputDecoration(
                            labelText: 'Phone No.',
                          ),
                        ),
                      ),
                    ]),
                    TextFormField(
                      decoration: const InputDecoration(
                        labelText: 'Organization',
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Padding(
                          padding: EdgeInsets.only(bottom: 8.0),
                          child: Text('Department',
                              style: TextStyle(
                                color: Color.fromARGB(255, 119, 119, 119),
                              )),
                        ),
                        SizedBox(width: 300, child: DropDown()),
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
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('Add User'),
              ),
            ],
          );
        });
  }
}
