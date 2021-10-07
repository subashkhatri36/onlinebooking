import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:onlinebooks/app/constant/app_color.dart';
import 'package:onlinebooks/app/constant/asset_image.dart';
import 'package:onlinebooks/app/constant/constants.dart';
import 'package:onlinebooks/app/constant/controller.dart';
import 'package:onlinebooks/app/modules/authentication/controllers/authentication_controller.dart';
import 'package:onlinebooks/app/utls/validation.dart';
import 'package:onlinebooks/app/widgets/button/button_widget.dart';
import 'package:onlinebooks/app/widgets/height_width.dart';
import 'package:onlinebooks/app/widgets/input/input_widget.dart';
import 'package:onlinebooks/app/widgets/text/normal_widget.dart';

class ForgetPasswordView extends StatelessWidget {
  const ForgetPasswordView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<AuthenticationController>();
    return Scaffold(
      appBar: AppBar(
        title: const NormalText('Forget Password'),
      ),
      body: Center(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Form(
            // key: controller.formkey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Image.asset(
                  AppImage.forgetPassword,
                  height: 200,
                  width: 200,
                ),
                const HeightWidget(
                  h: .01,
                ),
                const Text(
                  "Forget Password",
                  style: TextStyle(
                    fontSize: 22.0,
                  ),
                ),
                const HeightWidget(
                  h: .01,
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
                      const HeightWidget(
                        h: .01,
                      ),
                      SizedBox(
                        width: appController.width,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: Constants.defaultPadding),
                          child: CustomButton(
                            onPressed: () {
                              //controller.login();
                              // Get.to(DashboardView());
                              Get.back();
                            },
                            label: 'Send Code',
                            backgroundColor: AppColors.orangeColor,
                            textColor: AppColors.white,
                          ),
                        ),
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
