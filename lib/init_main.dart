import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_task/cores/services/network_service.dart';
import 'package:get/get.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';


initMain() {
  Get.lazyPut<NetworkInfo>(
      () => NetworkInfoImpl(Get.find<InternetConnectionCheckerPlus>()),
      fenix: true);

  // Get.lazyPut<Dio>(() => Dio(), fenix: true);

  // Get.lazyPut<DioInterceptors>(
  //         () => DioInterceptors(dio: Get.find(), secureStorage: Get.find()),
  //     fenix: true);

  Get.lazyPut<InternetConnectionCheckerPlus>(
      () => InternetConnectionCheckerPlus(),
      fenix: true);

  Get.lazyPut<FirebaseAuth>(() => FirebaseAuth.instance);

  Get.lazyPut<FirebaseFirestore>(() => FirebaseFirestore.instance);

  // Get.lazyPut<ImageRepo>(
  //         () =>
  //         ImageRepoImpl(networkInfo: Get.find(), remoteDataSource: Get.find()),
  //     fenix: true);
  //
  // Get.lazyPut<ImageRemoteDataSource>(
  //         () => ImageRemoteDataSourceImpl(Get.find()),
  //     fenix: true);
}
