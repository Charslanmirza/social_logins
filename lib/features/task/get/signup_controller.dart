import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_task/cores/enums.dart';
import 'package:flutter_task/cores/error/errors.dart';
import 'package:flutter_task/features/data_source/auth_source.dart';
import 'package:flutter_task/features/init_auth.dart';
import 'package:flutter_task/features/task/builder_ids.dart';
import 'package:flutter_task/features/task/get/auth_controller.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

class SignupController extends GetxController {
  CustomError? customError;

  final AuthenticationSource authenticationSource;

  SignupController({required this.authenticationSource});

  LoadingState signupLoadingState = LoadingState.loaded;

  final AuthController authController = Get.find();

  bool get isSignIn => signupLoadingState == LoadingState.loading;

  final signupFormKey = GlobalKey<FormState>();

  String? name;
  String? email;

  String? password;
  String? verifyPassword;
  int? signupUserId;

  setName(String? newName) {
    name = newName;
  }

  setEmail(String? newEmail) {
    email = newEmail;
  }

  setPassword(String? newPassword) {
    password = newPassword;
  }

  setVerifyPassword(String? newPassword) {
    verifyPassword = newPassword;
  }

  signup(BuildContext context) async {
    if (!signupFormKey.currentState!.validate()) {
      return;
    }
    signupLoadingState = LoadingState.loading;
    update([updateSignupScreen]);
    // showLoading(LoadingTapType.auth);
    await authenticationSource
        .createUserWithEmailAndPassword(email!, password!)
        .then((userCredential) async {
      Fluttertoast.showToast(msg: "Account Successfully created");
      Navigator.of(context).pop();
      authController.user = userCredential.user;
      customError = null;
      signupLoadingState = LoadingState.loaded;
      update([updateSignupScreen]);
    }).onError<CustomError>((error, stackTrace) {
      customError = error;
      signupLoadingState = LoadingState.loaded;
      update([updateSignupScreen]);
      getErrorDialog(error);
    });
  }
}
