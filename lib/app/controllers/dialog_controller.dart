part of global_controller;

class DialogController extends GetxController with GetSingleTickerProviderStateMixin, Bootable {
  static DialogController get instance => Get.find<DialogController>();
  late final AnimationController _animationController;
  late final Animation<double> _animation;
  final milliseconds = 200;

  @override
  Future<void> call() async {
    Get.put(this, permanent: true);
    _animationController = AnimationController(vsync: this, duration: Duration(milliseconds: milliseconds));
    _animation = Tween<double>(begin: 0, end: 1).animate(_animationController);
  }

  Future<void> warning({required String message}) async => await _showDialog(title: 'Warning', message: message);

  Future<void> showError({required String message}) async => await _showDialog(title: 'Error', message: message);

  Future<void> showSuccess({required String message}) async => await _showDialog(title: 'Success', message: message);

  void _hide() {
    _animationController.reverse();
    Future.delayed(Duration(milliseconds: milliseconds), () {
      if (Get.isDialogOpen ?? false) Get.back();
    });
  }

  _showDialog({required String title, required String message}) async {
    _animationController.forward();
    await Get.dialog(
        AppDialog.warning(
            title: 'Warning',
            message: message,
            animation: _animation,
            rightBtnText: 'OK',
            rightBtnOnPressed: () => _hide()),
        barrierDismissible: false);
  }
}