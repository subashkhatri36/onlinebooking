import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:onlinebooks/app/constant/asset_image.dart';
import 'package:onlinebooks/app/constant/controller.dart';
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
        UserAccountsDrawerHeader(
          accountName: appController.user != null
              ? Text(appController.user!.name)
              : const Text("Username"),
          accountEmail: const Text(""),
          currentAccountPicture: const CircleAvatar(
            backgroundColor: Colors.orange,
            backgroundImage: AssetImage(AppImage.appLogo),
          ),
        ),
        ListTile(
          leading: const Icon(Icons.cloud_upload),
          title: const Text("Upload Books"),
          onTap: () {
            Navigator.pop(context);
            Get.toNamed(Routes.uploadbooks);
          },
        ),
        ListTile(
          leading: const Icon(Icons.account_box),
          title: const Text("profile"),
          onTap: () {
            Navigator.pop(context);
          },
        ),
        ListTile(
          leading: const Icon(Icons.logout),
          title: const Text("Logout"),
          onTap: () {
            Navigator.pop(context);
          },
        ),
      ],
    ));
  }
}
