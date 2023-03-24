import 'package:get/get.dart';
import 'package:ninjafood/app/core/core.dart';
import 'package:ninjafood/app/global_controller/global_controller.dart';
import 'package:ninjafood/app/routes/routes.dart';

class SetLocationController extends BaseController {
  final AuthController authController;

  SetLocationController({required this.authController});

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void dispose() {
    super.dispose();
  }

  void onPressBack() {
    Get.back();
  }

  void onPressedSetLocation() {}

  void onPressedNext() {
    Get.toNamed(AppRouteProvider.signupSuccessScreen);
  }
}
