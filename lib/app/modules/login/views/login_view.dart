import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:onlinebooks/app/constant/constants.dart';
import 'package:onlinebooks/app/utls/validation.dart';
import 'package:onlinebooks/app/widgets/button/button_widget.dart';
import 'package:onlinebooks/app/widgets/input/input_widget.dart';
import 'package:onlinebooks/app/widgets/text/normal_widget.dart';
import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Form(
            key: controller.formkey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const SizedBox(
                  height: 20.0,
                ),
                const Text(
                  "Online Booking",
                  style: TextStyle(
                    fontSize: 22.0,
                  ),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                const Text(
                  "Start to Sign In",
                  style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Column(
                    children: <Widget>[
                      const SizedBox(
                        height: 10.0,
                      ),
                      InputField(
                        controller: controller.username,
                        hintText: 'Enter Email',
                        icon: Icons.email,
                        validator: (value) => validateEmail(string: value),
                      ),
                      const SizedBox(
                        height: 10.0,
                      ),
                      InputField(
                        controller: controller.password,
                        hintText: 'Enter Password',
                        validator: (value) => validatePassword(string: value),
                        icon: Icons.lock,
                        suffix: Icons.visibility_off,
                        obscureText: true,
                      ),
                      const SizedBox(
                        height: Constants.defaultMargin,
                      ),
                      const Align(
                          alignment: Alignment.centerRight,
                          child: NormalText('Forget Password?')),
                      const SizedBox(
                        height: Constants.defaultMargin,
                      ),
                      CustomButton(
                        onPressed: () {
                          controller.login();
                          // Get.to(DashboardView());
                        },
                        label: 'Login',
                      ),
                      const SizedBox(
                        height: 5.0,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
