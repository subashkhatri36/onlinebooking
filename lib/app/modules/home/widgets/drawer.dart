import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:onlinebooks/app/constant/asset_image.dart';
import 'package:onlinebooks/app/modules/home/controllers/home_controller.dart';
import 'package:onlinebooks/app/routes/app_pages.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<HomeController>();
    return Drawer(
        child: ListView(
      // Important: Remove any padding from the ListView.
      padding: EdgeInsets.zero,
      children: <Widget>[
        UserAccountsDrawerHeader(
          accountName: controller.profileData != null
              ? Text(controller.profileData!.name)
              : const Text("Username"),
          accountEmail: const Text(""),
          currentAccountPicture: controller.profileData == null
              ? const CircleAvatar(
                  backgroundColor: Colors.orange,
                  backgroundImage: AssetImage(AppImage.appLogo),
                )
              : controller.profileData!.profile.isEmpty
                  ? const CircleAvatar(
                      backgroundColor: Colors.orange,
                      backgroundImage: AssetImage(AppImage.appLogo),
                    )
                  : CircleAvatar(
                      backgroundColor: Colors.orange,
                      backgroundImage:
                          NetworkImage(controller.profileData!.profile),
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
          title: const Text("Saved Books"),
          onTap: () {
            Navigator.pop(context);
            Get.toNamed(Routes.savedbook);
          },
        ),
        ListTile(
          leading: const Icon(Icons.account_box),
          title: const Text("My Transaction"),
          onTap: () {
            Navigator.of(context).pop(true);
            Get.toNamed(Routes.transaction);
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
