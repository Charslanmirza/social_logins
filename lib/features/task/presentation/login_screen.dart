import 'package:flutter/material.dart';
import 'package:flutter_task/core/const.dart';
import 'package:flutter_task/core/placeholders.dart';
import 'package:flutter_task/cores/utils/validators.dart';
import 'package:flutter_task/features/task/get/auth_controller.dart';
import 'package:flutter_task/features/task/presentation/signup_screen.dart';
import 'package:flutter_task/features/task/widgets/custom_button_widget.dart';
import 'package:flutter_task/features/task/widgets/custom_screen_widget.dart';

import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_task/features/task/widgets/custom_text_field.dart';
import 'package:flutter_task/features/task/widgets/custom_text_widget.dart';
import 'package:get/get.dart';

import '../builder_ids.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return GetBuilder<AuthController>(
        id: updateLoginScreen,
        builder: (authcController) {
          return CustomScreenWidget(children: [
            GetBuilder<AuthController>(builder: (authcController) {
              return Form(
                key: authcController.loginFormKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Column(
                      children: <Widget>[
                        // Logo at the top (30% of the screen height)
                        Container(
                          height: MediaQuery.of(context).size.height * 0.3,
                          child: Image.asset(
                            height: 80,
                            width: 80,
                            "assets/images/logo-to-use.png",
                          ),
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          // Adjusted here
                          children: <Widget>[
                            CustomTextField(
                                initialValue: authcController.email,
                                onChanged: authcController.setEmail,
                                validator: EmailValidator.validator,
                                width: width,
                                text: 'Email',
                                label: "Email"),
                            sizeFieldMediumPlaceHolder,
                            PasswordField(
                              width: width,
                              label: "Password",
                              initialValue: authcController.password,
                              onChanged: authcController.setPassword,
                              validator: PasswordValidator.validator,
                            ),
                          ],
                        ),
                        // Form fields with reduced space
                      ],
                    ),
                    sizeFieldMediumPlaceHolder,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap:(){
                            authcController.loginWithGoogle(context);
                          },
                          child: Container(
                              decoration: BoxDecoration(
                                border: Border.all(
                                    color: Colors.grey.withOpacity(.2)),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(12)),
                              ),
                              child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 10.0, horizontal: 30),
                                  child: Row(
                                    children: [
                                      SvgPicture.asset(
                                        icon_google,
                                        width: 40,
                                      ),
                                      sizeHorizontalMinPlaceHolder,
                                      CustomTextWidget(
                                        text: 'Google ',
                                        fontWeight: FontWeight.w500,
                                        size: 14,
                                      ),
                                    ],
                                  ))),
                        ),
                        Container(
                            decoration: BoxDecoration(
                              border: Border.all(
                                  color: Colors.grey.withOpacity(.2)),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(12)),
                            ),
                            child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 10.0, horizontal: 30),
                                child: Row(
                                  children: [
                                    SvgPicture.asset(
                                      icon_apple,
                                      width: 40,
                                    ),
                                    sizeHorizontalMinPlaceHolder,
                                    CustomTextWidget(
                                      text: 'Apple ',
                                      size: 14,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ],
                                ))),
                      ],
                    ),
                    sizeFieldMediumPlaceHolder,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const CustomTextWidget(
                          text: 'Don\'t have an account? ',
                          size: 16,
                          textAlign: TextAlign.center,
                          fontWeight: FontWeight.w400,
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => SignupScreen(),
                            ));
                          },
                          child: const CustomTextWidget(
                            text: 'Register ',
                            size: 16,
                            colorText: Colors.blueAccent,
                            textAlign: TextAlign.center,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              );
            }),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                // Login button at the bottom
                ButtonWidget(
                  text: "Login",
                  buttonType: ButtonType.fill,
                  // color: AppColors.primaryColor,
                  width: 500,
                  expand: true,
                  isLoading: authcController.isLoggingIn,
                  textStyle: const TextStyle(
                    fontSize: 16,
                    //  color: AppColors.whiteColor,
                    fontWeight: FontWeight.w400,
                    letterSpacing: 0.5,
                  ),
                  onPressed: () {
                    authcController.login(context);
                    // Handle the 'Done' button tap if needed
                  },
                ),
              ],
            )
          ]);
        });
  }
}
