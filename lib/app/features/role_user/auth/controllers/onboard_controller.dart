import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ninjafood/app/core/core.dart';
import 'package:ninjafood/app/features/role_user/auth/infrastructure/models/onboard_model.dart';
import 'package:ninjafood/app/routes/routes.dart';

class OnboardController extends BaseController {
  List<OnboardModel> datas = OnboardModel.datas;
  late final PageController pageController;
  late final int lastCounter;

  @override
  void onInit() {
    pageController = PageController(initialPage: 0);
    super.onInit();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  void onPressedNext(int index) {
    if (index == 1) {
      Get.toNamed(AppRouteProvider.signinScreen);
      return;
    }
    pageController.nextPage(duration: Duration(milliseconds: 500), curve: Curves.ease);
  }
}