import 'package:flutter_task/features/init_auth.dart';
import 'package:flutter_task/features/task/get/auth_controller.dart';
import 'package:flutter_task/init_main.dart';
import 'package:get/get.dart';

initAll() async {
  initAuth();
  initMain();
}

removeAll() {
  Get.delete<AuthController>();
}
