import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_task/core/const.dart';
import 'package:flutter_task/cores/utils/validators.dart';
import 'package:flutter_task/features/task/builder_ids.dart';
import 'package:flutter_task/features/task/get/signup_controller.dart';
import 'package:flutter_task/features/task/widgets/custom_button_widget.dart';
import 'package:flutter_task/features/task/widgets/custom_checkbox.dart';
import 'package:flutter_task/features/task/widgets/custom_screen_widget.dart';
import 'package:flutter_task/features/task/widgets/custom_text_field.dart';
import 'package:flutter_task/features/task/widgets/custom_text_widget.dart';
import 'package:get/get.dart';

import '../../../core/placeholders.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return GetBuilder<SignupController>(
        id: updateSignupScreen,
        builder: (signupController) {
      return Form(
        key: signupController.signupFormKey,
        child: CustomScreenWidget(children: [
          SingleChildScrollView(
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
                          width: width,
                          text: 'Email',
                          label: "Email",
                          initialValue: signupController.email,
                          onChanged: signupController.setEmail,
                          validator: EmailValidator.validator,
                        ),
                        sizeFieldMediumPlaceHolder,
                        PasswordField(
                          width: width,
                          label: "Password",
                          initialValue: signupController.password,
                          onChanged: signupController.setPassword,
                          validator: PasswordValidator.validator,
                        ),
                        sizeFieldMediumPlaceHolder,
                        PasswordField(
                          width: width,
                          label: "Confirm Password",
                          initialValue: signupController.verifyPassword,
                          onChanged: signupController.setVerifyPassword,
                          validator: (password) =>
                              ConfirmPasswordValidator.validator(
                                  signupController.password, password),
                        ),
                      ],
                    ),
                    // Form fields with reduced space
                  ],
                ),
                sizeFieldMediumPlaceHolder,
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const CustomTextWidget(
                      text: 'Already have an account? ',
                      size: 16,
                      textAlign: TextAlign.center,
                      fontWeight: FontWeight.w400,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                      child: const CustomTextWidget(
                        text: 'Login ',
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
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Align(
                alignment: Alignment.center,
                child: CheckBoxText(
                    onChanged: (value) {},
                    isChecked: false,
                    text: "Accept all terms and conditions"),
              ),
              ButtonWidget(
                text: "Registrati",
                buttonType: ButtonType.fill,
                // color: AppColors.primaryColor,
                width: 500,
                expand: true,
                isLoading: signupController.isSignIn,
                textStyle: const TextStyle(
                  fontSize: 16,
                  //  color: AppColors.whiteColor,
                  fontWeight: FontWeight.w400,
                  letterSpacing: 0.5,
                ),
                onPressed: () {
                  signupController.signup(context);
                  // Handle the 'Done' button tap if needed
                },
              ),
            ],
          )
        ]),
      );
    });
  }
}
