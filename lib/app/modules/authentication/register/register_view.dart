import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:onlinebooks/app/constant/app_color.dart';
import 'package:onlinebooks/app/constant/asset_image.dart';
import 'package:onlinebooks/app/constant/controller.dart';
import 'package:onlinebooks/app/modules/authentication/controllers/authentication_controller.dart';
import 'package:onlinebooks/app/routes/app_pages.dart';
import 'package:onlinebooks/app/utls/validation.dart';
import 'package:onlinebooks/app/widgets/button/button_widget.dart';
import 'package:onlinebooks/app/widgets/custom_snackbar.dart';
import 'package:onlinebooks/app/widgets/height_width.dart';
import 'package:onlinebooks/app/widgets/input/input_withoutborder.dart';
import 'package:onlinebooks/app/widgets/text/normal_widget.dart';
import 'package:onlinebooks/app/widgets/text/two_color_text.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //for register page
    final TextEditingController regusername = TextEditingController();
    final TextEditingController regname = TextEditingController();
    final TextEditingController regpassword = TextEditingController();
    final TextEditingController regconpassword = TextEditingController();
    final GlobalKey<FormState> registrationformkey = GlobalKey<FormState>();

    final controller = Get.find<AuthenticationController>();
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Form(
            key: registrationformkey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const HeightWidget(
                  h: .01,
                ),
                const CircleAvatar(
                  radius: 60,
                  backgroundImage: AssetImage(AppImage.appLogo),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                const Text(
                  "Register",
                  style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                ),
                const HeightWidget(
                  h: .01,
                ),
                Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Column(
                    children: <Widget>[
                      const HeightWidget(
                        h: .01,
                      ),
                      InputField(
                        controller: regname,
                        hintText: 'Full name',
                        icon: Icons.account_box,
                        validator: (value) => validateIsEmpty(string: value),
                      ),
                      InputField(
                        controller: regusername,
                        hintText: 'Enter Email',
                        icon: Icons.email,
                        validator: (value) => validateEmail(string: value),
                      ),
                      InputField(
                        controller: regpassword,
                        hintText: 'Enter Password',
                        validator: (value) => validatePassword(string: value),
                        icon: Icons.lock,
                        obscureText: true,
                      ),
                      InputField(
                        controller: regconpassword,
                        hintText: 'Confirmed Password',
                        validator: (value) => validatePasswordConfirm(
                            cPassword: value, password: regpassword.text),
                        icon: Icons.lock,
                        obscureText: true,
                      ),
                      const HeightWidget(
                        h: .01,
                      ),
                      Align(
                          alignment: Alignment.centerRight,
                          child: InkWell(
                              onTap: () {
                                Get.offNamed(Routes.forgetpassword);
                              },
                              child: const NormalText('Forget Password?'))),
                      const HeightWidget(
                        h: .02,
                      ),
                      SizedBox(
                        width: appController.width,
                        child: CustomButton(
                          onPressed: () {
                            if (registrationformkey.currentState!.validate()) {
                              controller.registration(
                                regusername.text,
                                regname.text,
                                regpassword.text,
                                regconpassword.text,
                              );
                            } else {
                              //custome snackbar
                              customSnackbar(
                                  message: 'Email or Password not valid !',
                                  snackPosition: SnackPosition.TOP,
                                  leadingIcon: Icons.warning);
                            }
                            // Get.to(DashboardView());
                          },
                          label: 'Register',
                          textColor: AppColors.white,
                          backgroundColor: AppColors.orangeColor,
                        ),
                      ),
                      const HeightWidget(
                        h: .02,
                      ),
                      InkWell(
                        onTap: () {
                          Get.offNamed(Routes.login);
                          // Get.toNamed(Routes.register);
                        },
                        child: const TwoColorText(
                          'Already Have An Account',
                          'Login',
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
