import 'package:flutter/material.dart';
import 'package:heart_registration_app/screens/admin.dart';
import 'package:heart_registration_app/screens/department.dart';

class AdminDrawer extends StatefulWidget {
  const AdminDrawer({super.key});

  @override
  State<AdminDrawer> createState() => _AdminDrawerState();
}

class _AdminDrawerState extends State<AdminDrawer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Drawer(
        child: ListView(
          padding: const EdgeInsets.all(0),
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ), //BoxDecoration
              child: UserAccountsDrawerHeader(
                decoration: BoxDecoration(color: Colors.blue),
                accountName: Text(
                  "Our Admin",
                  style: TextStyle(fontSize: 18),
                ),
                accountEmail: Text("Admin27@gmail.com"),
                currentAccountPictureSize: Size.square(50),
                currentAccountPicture: CircleAvatar(
                  backgroundColor: Color.fromARGB(255, 0, 229, 194),
                  child: Text(
                    "A",
                    style: TextStyle(fontSize: 30.0, color: Colors.white),
                  ), //Text
                ), //circleAvatar
              ), //UserAccountDrawerHeader
            ), //DrawerHeader
            ListTile(
              leading: const Icon(Icons.person),
              title: const Text(
                ' User List',
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const AdminPage()),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.business_center),
              title: const Text(
                'Departments ',
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const DepartmentPage()),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.business),
              title: const Text(
                ' Organizations ',
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.logout),
              title: const Text(
                'LogOut',
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
