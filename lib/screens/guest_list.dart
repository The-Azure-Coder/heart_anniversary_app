import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:heart_registration_app/screens/Registration.dart';
import 'package:heart_registration_app/services/network_handler.dart';

import '../services/secure_store.dart';
import 'package:draggable_fab/draggable_fab.dart';

class GuestList extends StatefulWidget {
  const GuestList({super.key});

  @override
  State<GuestList> createState() => _GuestListState();
}

class _GuestListState extends State<GuestList> {
  var _registrantsList = [];
  int regCount = 0;
  String first_name = '';
  String last_name = '';
  String email_address = '';
  String phone = '';
  // defaulted to test until dropdown issue is resolved
  String department = "6341594525e3e385fa19bd50";
  String organization = '';
  String registration_number = '';

  String error = '';

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

  void generateCertificate({String registrant = ""}) async {
    try {
      var user = await SecureStore.getUser();

      final response = await NetworkHandler.post('/participants', {
        "demonstrator": user["_id"],
        "department": user["department"],
        "registrant": registrant
      });
      final jsonData = jsonDecode(response)['data'];
      print(response);

      setState(() {
        _registrantsList = jsonData;
        regCount = _registrantsList.length;
      });
    } catch (err) {}
  }

  void editRegistrant({Map<String, dynamic> registrant = const {}}) async {
    showRegistrantFields(registrant: registrant);
  }

  void deleteRegistrant({String registrantID = ''}) async {
    try {
      final response =
          await NetworkHandler.delete('/registrants/$registrantID');
      final jsonData = jsonDecode(response)['data'];
      print(registrantID);
      print(response);
      print('deleted sucessfully');

      setState(() {});
    } catch (err) {}
  }

  @override
  void initState() {
    super.initState();
    getRegistrants();
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(160),
        child: AppBar(
          titleSpacing: 0,
          elevation: 0.0,
          title: const Text(
            'Guest Page',
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
                    Text('Hello User',
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
              Positioned(
                child: Container(
                  margin: const EdgeInsets.only(left: 295.0, top: 85),
                  width: 70,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(
                        'assets/images/ribbon.png',
                      ),
                    ),
                  ),
                ),
              )
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
              const Text('Guest Lists ',
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
              itemCount: _registrantsList.length,
              itemBuilder: (context, i) {
                final registrant = _registrantsList[i];
                return Column(children: [
                  Card(
                      child: ListTile(
                    title: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                              style: const TextStyle(
                                fontSize: 18.0,
                              ),
                              "${registrant['first_name']}, ${registrant['last_name']}"),
                            // Text(
                            //   "Reg #: ${registrant['registration_number']}",
                            //   style: const TextStyle(
                            //     fontSize: 14.0,
                            //     fontStyle: FontStyle.italic,
                            //     color: Colors.grey,
                            //   ),
                            // )
                          // }else
                        ]),
                    subtitle: Text(
                        "${registrant['organization']}, ${registrant['department']['name']}"),
                    trailing: PopupMenuButton(
                      itemBuilder: (context) {
                        return [
                          // PopupMenuItem(
                          //   value: 'edit',
                          //   child: TextButton(
                          //       onPressed: () {
                          //         editRegistrant(registrant: registrant)
                          //       },
                          //       child: const Text('Edit')),
                          // ),
                          PopupMenuItem(
                            value: 'delete',
                            child: TextButton(
                                onPressed: () {
                                  deleteRegistrant(
                                      registrantID: registrant['_id']);
                                  getRegistrants();
                                },
                                child: const Text('Delete')),
                          ),
                          const PopupMenuItem(
                            value: 'generate certificate',
                            child: Text('Generate Certificate'),
                          ),
                        ];
                      },
                      onSelected: (value) {
                        generateCertificate(registrant: registrant["_id"]);
                      },
                    ),
                  )),
                ]);
              })
        ],
      ),
      floatingActionButton: DraggableFab(
          child: FloatingActionButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Register()),
                ).then((value) => getRegistrants());
              },
              child: const Icon(Icons.add))),
    );
  }
}

void showRegistrantFields({required Map<String, dynamic> registrant}) {}
