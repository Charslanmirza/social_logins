import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_task/cores/error/errors.dart';
import 'package:flutter_task/cores/services/network_service.dart';
import 'package:google_sign_in/google_sign_in.dart';

abstract class AuthenticationSource {
  Future<UserCredential> signInWithEmailAndPassword(
      String email, String password);

  Future<UserCredential> signInWithGoogle();

  Future<UserCredential> createUserWithEmailAndPassword(
    String email,
    String password,
  );

  // Future<AppUserModel> getUser(String userId);
  //
  // Future<AppUserModel> getLoggedUserDetail();

  Future signOut();
}

class AuthenticationSourceImpl implements AuthenticationSource {
  final FirebaseAuth firebaseAuth;
  final GoogleSignIn googleSignIn;
  final NetworkInfo networkInfo;
  final FirebaseFirestore fireStore;

  AuthenticationSourceImpl(
      {required this.firebaseAuth,
      required this.networkInfo,
      required this.fireStore,
      required this.googleSignIn});

  @override
  Future<UserCredential> signInWithEmailAndPassword(
      String email, String password) async {
    // await checkNetwork(networkInfo);
    try {
      final auth = await firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
      // customLog(url: 'Login', response: auth);
      return auth;
    } on FirebaseAuthException catch (error) {
      return Future.error(GeneralError(title: "Login", message: error.message));
    }
  }

  @override
  Future<UserCredential> signInWithGoogle() async {
    try {
      // Start the Google sign-in flow
      final GoogleSignInAccount? googleUser = await googleSignIn.signIn();

      // Obtain the authentication details from the Google user
      final GoogleSignInAuthentication googleAuth = await googleUser!.authentication;

      // Create the Google Auth credential
      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      // Sign in to Firebase with the Google Auth credential
      final UserCredential userCredential = await firebaseAuth.signInWithCredential(credential);

      return userCredential;
    } on FirebaseAuthException catch (error) {
      throw GeneralError(title: "Google Sign-In", message: error.message);
    } catch (error) {
      throw GeneralError(title: "Google Sign-In", message: "Something went wrong");
    }
  }

  @override
  Stream<User?> authStream() async* {
    if (!(await networkInfo.isConnected)) {
      yield* Stream.error(NetworkError());
    }
    yield* firebaseAuth.userChanges();
  }

  @override
  Future signOut() async {
    return await firebaseAuth.signOut();
  }

  @override
  Future<UserCredential> createUserWithEmailAndPassword(
    String email,
    String password,
  ) async {
    // await checkNetwork(networkInfo);
    try {
      final userCredential = await firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: password);
      final user = userCredential.user;

      // if (user != null) {
      //   final userJson = AppUserModel(
      //       id: user.uid,
      //       name: name,
      //       email: email,
      //       registerType: 'EMAIL',
      //       role: 'user',
      //       status: false,
      //       createdAt: DateTime.now());
      //   final userJsonMap = userJson.toJson();
      //
      //   await FirebaseFirestore.instance
      //       .collection('users')
      //       .doc(user.uid)
      //       .set(userJsonMap);
      // }
      final auth = await firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
      // customLog(url: 'Signup', response: auth);
      return auth;
    } on FirebaseAuthException catch (error) {
      throw GeneralError(title: "Registration", message: error.message);
    } catch (error) {
      throw GeneralError(
          title: "Email Sign-In", message: "Some thing went wrong");
    }
  }
}
