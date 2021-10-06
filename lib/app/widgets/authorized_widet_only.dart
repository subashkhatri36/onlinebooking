import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:onlinebooks/app/constant/controller.dart';
import 'package:onlinebooks/app/routes/app_pages.dart';
import 'package:onlinebooks/app/widgets/button/button_widget.dart';

authorizedAccess(Widget child) {
  if (!appController.authorized) {
    return const AuthWidget();
  } else {
    return child;
  }
}

class AuthWidget extends StatefulWidget {
  const AuthWidget({
    Key? key,
  }) : super(key: key);

  @override
  State<AuthWidget> createState() => _AuthWidgetState();
}

class _AuthWidgetState extends State<AuthWidget> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: CustomButton(
          onPressed: () {
            Get.offNamed(Routes.login);
          },
          label: 'Go to LogIn'),
    ));
  }

  // delay() {
  //   showDialog(
  //     context: context,
  //     builder: (ctx) => AlertDialog(
  //       title: const Text("Warning !"),
  //       content: const Text("Do you Want to exit application ?"),
  //       actions: <Widget>[
  //         CustomButton(
  //             onpressed: () {
  //               Get.offNamed(Routes.LOGIN);
  //             },
  //             btnText: 'Login'),
  //       ],
  //     ),
  //   );
  // }
}
