import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_task/cores/enums.dart';
import 'package:flutter_task/cores/error/errors.dart';
import 'package:flutter_task/features/data_source/auth_source.dart';
import 'package:flutter_task/features/init_auth.dart';
import 'package:flutter_task/features/task/builder_ids.dart';
import 'package:flutter_task/features/task/presentation/home_screen.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  CustomError? customError;

  final AuthenticationSource authenticationSource;
  User? user;

  AuthController({
    required this.authenticationSource,
  });

  ///todo make this false while in the middle false
  bool isLoggedIn = false;
  bool isLoggedInAsGuest = false;

  LoadingState authLoadingState = LoadingState.loading;

  bool get isAuthenticating => authLoadingState == LoadingState.loading;

  LoadingState loginLoadingState = LoadingState.loaded;

  bool get isLoggingIn => loginLoadingState == LoadingState.loading;

  LoadingState forgotPasswordLoadingState = LoadingState.loaded;

  bool get isForgotPassword =>
      forgotPasswordLoadingState == LoadingState.loading;

  LoadingState googleLoadingState = LoadingState.loaded;

  bool get isGoogleLoggingIn => googleLoadingState == LoadingState.loading;

  LoadingState fbLoadingState = LoadingState.loaded;

  bool get isFbLoggingIn => fbLoadingState == LoadingState.loading;

  final loginFormKey = GlobalKey<FormState>();
  final signupFormKey = GlobalKey<FormState>();
  final forgotPasswordFormKey = GlobalKey<FormState>();

  String? email;
  String? resetEmail;
  String? password;

  RxBool obscurePassword = true.obs;

  changePasswordVisibility() {
    obscurePassword.value = !obscurePassword.value;
  }

  setResetEmail(String? newEmail) {
    resetEmail = newEmail;
  }

  setEmail(String? newEmail) {
    email = newEmail;
  }

  setPassword(String? newPassword) {
    password = newPassword;
  }

  login(BuildContext context) async {
    if (!loginFormKey.currentState!.validate()) {
      return;
    }
    loginLoadingState = LoadingState.loading;
    update([updateLoginScreen]);
    await authenticationSource
        .signInWithEmailAndPassword(email!, password!)
        .then((userCredential) async {
      Fluttertoast.showToast(msg: "Successfully signed in");
      Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => HomeScreen(),
      ));
      isLoggedIn = true;
      customError = null;
      user = userCredential.user;
      email = null;
      password = null;
      loginLoadingState = LoadingState.loaded;
      update([updateLoginScreen]);
    }).onError<CustomError>((error, stackTrace) {
      user = null;

      customError = error;
      loginLoadingState = LoadingState.loaded;
      update([updateLoginScreen]); //
      getErrorDialog(error);
    });
  }

  Future<void> loginWithGoogle(BuildContext context) async {
    await authenticationSource.signInWithGoogle().then((userCredential) {
      Fluttertoast.showToast(msg: "Successfully signed in");
      Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => HomeScreen(),
      ));
      // initAll();
      isLoggedIn = true;
      customError = null;
      user = userCredential.user;
      email = null;
      password = null;
    }).onError<CustomError>((error, stackTrace) {
      print('error ${error.message}');
      // user = null;
      //
      // getErrorDialog(error);
    });
  }

  signOut() async {
    Future.delayed(const Duration(seconds: 5));
    // await authenticationSource.signOut();
    Get.back();
    // removeAll();
    update();
  }

  @override
  onInit() async {
    super.onInit();
    // try {
    //   final authStream = authenticationSource.authStream().asBroadcastStream();
    //   authStream.listen((User? changedUser) async {
    //     if (changedUser == null) {
    //       isLoggedIn = false;
    //       isLoggedInAsGuest == false;
    //       user = null;
    //       update([updatedAuthWrapper]);
    //     } else {
    //       await authLocalDataSource.isLoggedAsGuest().then((value) {
    //         if (value == true) {
    //           isLoggedInAsGuest = value!;
    //           print('value of guest user is${value}');
    //           isLoggedIn = false;
    //           user = changedUser;
    //           update([updatedAuthWrapper]);
    //         } else {
    //           isLoggedIn = true;
    //           isLoggedInAsGuest == false;
    //           user = null;
    //           user = changedUser;
    //           update([updatedAuthWrapper]);
    //         }
    //       });
    //     }
    //   });
    //
    //   await authStream.first;
    //   authLoadingState = LoadingState.loaded;
    //   update([updatedAuthWrapper]);
    //   FlutterNativeSplash.remove();
    // } on NetworkError catch (error) {
    //   FlutterNativeSplash.remove();
    //   customError = error;
    //   authLoadingState = LoadingState.loaded;
    //   update([updatedAuthWrapper]);
    // }
  }
}
