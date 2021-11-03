import 'package:get/instance_manager.dart';
import 'package:news_app_flutter/app/modules/user_auth/controller.dart';

class AuthBinding extends Bindings{
  @override
  void dependencies() {
    // TODO: implement dependencies

    Get.put(AuthController());
  }

}