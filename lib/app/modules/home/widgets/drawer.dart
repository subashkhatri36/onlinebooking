import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:onlinebooks/app/routes/app_pages.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: ListView(
      // Important: Remove any padding from the ListView.
      padding: EdgeInsets.zero,
      children: <Widget>[
        const UserAccountsDrawerHeader(
          accountName: Text("Username"),
          accountEmail: Text("email@gmail.com"),
          currentAccountPicture: CircleAvatar(
            backgroundColor: Colors.orange,
            child: Text(
              "A",
              style: TextStyle(fontSize: 40.0),
            ),
          ),
        ),
        ListTile(
          leading: Icon(Icons.home),
          title: Text("Upload Books"),
          onTap: () {
            Get.toNamed(Routes.uploadbooks);
          },
        ),
        ListTile(
          leading: Icon(Icons.settings),
          title: Text("Settings"),
          onTap: () {
            Navigator.pop(context);
          },
        ),
        ListTile(
          leading: Icon(Icons.contacts),
          title: Text("Contact Us"),
          onTap: () {
            Navigator.pop(context);
          },
        ),
      ],
    ));
  }
}
