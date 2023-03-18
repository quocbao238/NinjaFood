import 'package:flutter/material.dart';
import 'package:ninjafood/app/features/sign_in/presentation/layout/mobile/sign_in_mobile_view.dart';
import 'package:ninjafood/app/theme/core_widget/core_widget.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppViewLayout(mobileView: SignInMobileScreen());
  }
}