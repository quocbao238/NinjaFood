import 'package:flutter/material.dart';
import 'package:ninja_theme/ninja_theme.dart';
import 'package:ninjafood/app/features/role_user/auth/presentation/layout/mobile/sign_up_upload_photo_mobile_view/sign_up_upload_photo_mobile_view.dart';

class SignUpUploadPhotoScreen extends StatelessWidget {
  const SignUpUploadPhotoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppViewLayout(
      mobileView: SignUpUploadPhotoMobileView(),
    );
  }
}
