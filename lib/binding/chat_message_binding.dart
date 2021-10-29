import 'package:get/get.dart';
import '../controller/collection_package.dart';

class ChatMessageBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => ChatMessageController());
  }
}