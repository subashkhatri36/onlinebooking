import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:onlinebooks/app/constant/app_color.dart';
import 'package:onlinebooks/app/constant/asset_image.dart';
import 'package:onlinebooks/app/constant/constants.dart';
import 'package:onlinebooks/app/constant/controller.dart';
import 'package:onlinebooks/app/modules/authentication/controllers/authentication_controller.dart';
import 'package:onlinebooks/app/modules/authentication/forgetpassword/forget_password._view.dart';
import 'package:onlinebooks/app/routes/app_pages.dart';
import 'package:onlinebooks/app/utls/validation.dart';
import 'package:onlinebooks/app/widgets/button/button_widget.dart';
import 'package:onlinebooks/app/widgets/height_width.dart';
import 'package:onlinebooks/app/widgets/input/input_widget.dart';
import 'package:onlinebooks/app/widgets/text/normal_widget.dart';
import 'package:onlinebooks/app/widgets/text/two_color_text.dart';

class LoginView extends GetView<AuthenticationController> {
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
                const CircleAvatar(
                  radius: 60,
                  backgroundImage: AssetImage(AppImage.appLogo),
                ),
                const HeightWidget(
                  h: .01,
                ),
                const Text(
                  "Online Booking",
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
                      InputField(
                        controller: controller.password,
                        hintText: 'Enter Password',
                        validator: (value) => validatePassword(string: value),
                        icon: Icons.lock,
                        suffix: Icons.visibility_off,
                        obscureText: true,
                      ),
                      const HeightWidget(
                        h: .01,
                      ),
                      Align(
                          alignment: Alignment.centerRight,
                          child: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 18.0),
                            child: InkWell(
                                onTap: () {
                                  Get.to(const ForgetPasswordView());
                                },
                                child: const NormalText('Forget Password?')),
                          )),
                      const HeightWidget(
                        h: .04,
                      ),
                      SizedBox(
                        width: appController.width,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: Constants.defaultPadding),
                          child: CustomButton(
                            onPressed: () {
                              controller.login();
                              // Get.to(DashboardView());
                            },
                            label: 'Login',
                            backgroundColor: AppColors.orangeColor,
                            textColor: AppColors.white,
                          ),
                        ),
                      ),
                      const HeightWidget(
                        h: .04,
                      ),
                      InkWell(
                        onTap: () {
                          Get.offNamed(Routes.register);
                          //  Navigator.of(context).pushNamed(Routes.register);
                        },
                        child: const TwoColorText(
                          'Create An Account',
                          'Register',
                          isUnderline1: true,
                        ),
                      )
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
