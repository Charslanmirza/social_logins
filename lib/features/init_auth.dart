import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_task/cores/constants/app_literals.dart';
import 'package:flutter_task/cores/error/errors.dart';
import 'package:flutter_task/features/data_source/auth_source.dart';
import 'package:flutter_task/features/task/get/signup_controller.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'task/get/auth_controller.dart';

initAuth() async {
  Get.lazyPut<AuthenticationSource>(
      () => AuthenticationSourceImpl(
          firebaseAuth: Get.find(),
          fireStore: Get.find(),
          googleSignIn: Get.find(),
          networkInfo: Get.find()),
      fenix: true);

  Get.lazyPut<FirebaseAuth>(() => FirebaseAuth.instance);

  Get.lazyPut<GoogleSignIn>(() => GoogleSignIn());

  Get.lazyPut<FirebaseFirestore>(() => FirebaseFirestore.instance);

  Get.lazyPut(() => AuthController(authenticationSource: Get.find()),
      fenix: true);

  Get.lazyPut(() => SignupController(authenticationSource: Get.find()),
      fenix: true);
}

Future<void> getErrorDialog(CustomError? error,
    {String buttonText = AppLiterals.okButtonText, Function()? onPressed}) {
  return Get.dialog(
      ChoiceDialog(
          title: error!.title,
          message:
              //'${error.message} ${kDebugMode ? '\n\n File: ${getFileWithError(error.stackTrace)}' : ''}',

              '${error.message} ${kDebugMode ? '\n\n Error: ${error.stackTrace}' : ''}',
          firstChoice: buttonText,
          firstOnPressed: () {
            if (onPressed != null) {
              onPressed();
            } else {
              Get.back();
            }
          }),
      barrierDismissible: true,
      useSafeArea: true);
}

/// This is built for displaying error and success messages based on the
/// API response, and if any action is to be performed based on a particular response,
/// then prefer using [ChoiceBottomSheet] in [showModalBottomSheet]
class ChoiceDialog extends StatelessWidget {
  const ChoiceDialog(
      {Key? key,
      this.title = AppLiterals.titleText,
      this.message = AppLiterals.messageText,
      this.firstChoice = AppLiterals.yesText,
      this.secondChoice = AppLiterals.noText,
      required this.firstOnPressed,
      this.secondOnPressed})
      : super(key: key);
  final String title;
  final String message;
  final String firstChoice;
  final String? secondChoice;
  final Function() firstOnPressed;
  final Function()? secondOnPressed;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
      clipBehavior: Clip.hardEdge,
      child: Container(
        padding: const EdgeInsets.only(top: 16.0, bottom: 0.0),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.min,
            children: [
              //  AppPlaceHolders.sizeFieldSmallPlaceHolder,
              Text(
                title,
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.black,
                    fontSize:
                        Theme.of(context).textTheme.titleMedium!.fontSize!,
                    fontWeight: FontWeight.bold),
              ),
              //AppPlaceHolders.sizeFieldLargePlaceHolder,
              const SizedBox(
                height: 15.0,
              ),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Text(
                  message,
                  textAlign: TextAlign.center,
                  maxLines: 7,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    height: 1.4,
                    color: Colors.black,
                  ),
                ),
              ),
              const SizedBox(
                height: 10.0,
              ),
              //  AppPlaceHolders.sizeFieldLargePlaceHolder,
              SizedBox(
                height: 50.0,
                child: TextButton(
                  style: getButtonStyles(0),
                  onPressed: firstOnPressed,
                  child: Text(firstChoice,
                      style: const TextStyle(
                        color: Colors.black,
                      )),
                ),
              ),
              if (secondOnPressed != null)
                SizedBox(
                  height: 50.0,
                  child: TextButton(
                    style: getButtonStyles(1),
                    onPressed: secondOnPressed,
                    child: Text(secondChoice!),
                  ),
                ),
            ]),
      ),
    );
  }

  getButtonStyles(int index) {
    return ButtonStyle(
        elevation: index == 0 ? MaterialStateProperty.all<double>(0) : null,
        padding: MaterialStateProperty.all(EdgeInsets.zero),
        backgroundColor: MaterialStateProperty.all(Colors.transparent),
        foregroundColor: MaterialStateProperty.all(Colors.blueAccent),
        textStyle: MaterialStateProperty.all(
            const TextStyle(fontWeight: FontWeight.bold)),
        shape: MaterialStateProperty.all(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(0.0))),
        side: index == 0
            ? MaterialStateProperty.all(const BorderSide(
                color: Colors.blueAccent,
              ))
            : null);
  }
}
