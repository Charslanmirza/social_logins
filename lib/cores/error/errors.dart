import 'package:flutter/cupertino.dart';
import 'package:flutter_task/cores/constants/app_literals.dart';

import '../styles/icons.dart';
class CustomError {
  IconData iconData;
  String title;
  String? message;
  String stackTrace;

  CustomError(
      {required this.iconData,
      required this.title,
      required this.message,
      required this.stackTrace});
}

class GeneralError extends CustomError {
  GeneralError(
      {super.iconData = AppIcons.iconError,
      super.title = AppLiterals.defaultGeneralErrorTitle,
      super.message = AppLiterals.defaultGeneralErrorMessage,
      super.stackTrace = AppLiterals.emptyString});
}

///This error is thrown when user enters in application and
///if client id is expired,disabled by admin,or have'nt paid,
class ClientError extends CustomError {
  ClientError(
      {super.iconData = AppIcons.iconServerError,
      super.title = AppLiterals.defaultClientErrorTitle,
      super.message = AppLiterals.defaultClientErrorMessage,
      super.stackTrace = AppLiterals.emptyString});
}

class NetworkError extends CustomError {
  NetworkError(
      {super.iconData = AppIcons.iconNoInternet,
      super.title = AppLiterals.defaultNetworkErrorTitle,
      super.message = AppLiterals.defaultNetworkErrorMessage,
      super.stackTrace = AppLiterals.emptyString});
}



// class CustomAuthException extends FirebaseAuthException {
//   CustomAuthException(String code, String message)
//       : super(code: code, message: message) {
//     switch (code) {
//       case "user-not-found":
//         throw CustomException.userNotFound(message);
//       case "wrong-password":
//         throw CustomException.wrongPassword(message);
//       case "user-disabled":
//         throw CustomException(errorMessage: message);
//       case "invalid-email":
//         throw CustomException(errorMessage: message);
//       case "email-already-in-use":
//         throw CustomException(errorMessage: message);
//       case 'weak-password':
//         throw CustomException(errorMessage: message);
//       case 'operation-not-allowed':
//         throw CustomException(errorMessage: message);
//       case 'auth/user-not-found':
//         throw CustomException(errorMessage: message);
//       case 'auth/invalid-email':
//         throw CustomException(errorMessage: message);
//       case 'account-exists-with-different-credential':
//         throw CustomException(errorMessage: message);
//       case 'invalid-credential':
//         throw CustomException(errorMessage: message);
//       case 'invalid-verification-code':
//         throw CustomException(errorMessage: message);
//       case 'invalid-verification-id':
//         throw CustomException(errorMessage: message);
//     }
//   }
// }

class CustomException {
  final String? errorMessage;

  CustomException({this.errorMessage});

  factory CustomException.userNotFound(String message) = UserNotFoundException;
  factory CustomException.wrongPassword(String message) =
  WrongPasswordException;
}

class UserNotFoundException extends CustomException {
  UserNotFoundException(
      this.message,
      ) : super(errorMessage: message);
  final String? message;
}

class WrongPasswordException extends CustomException {
  WrongPasswordException(
      this.message,
      ) : super(errorMessage: message);
  final String? message;
}