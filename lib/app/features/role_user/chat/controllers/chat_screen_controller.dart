import 'package:get/get.dart';
import 'package:ninjafood/app/core/core.dart';
import 'package:ninjafood/app/features/role_user/chat/infrastructure/models/chat_model.dart';
import 'package:ninjafood/app/features/role_user/tabs/controllers/tabs_controller.dart';
import 'package:ninjafood/app/routes/routes.dart';

class ChatScreenController extends BaseController {
  final TabsController tabsController;
  ChatScreenController({required this.tabsController});
  List<ChatModel> chatList = ChatModel.chatList;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void onTapChat(ChatModel chatModel) {
    Get.toNamed(AppRouteProvider.chatDetailsScreen, arguments: chatModel);
  }
}
