import 'package:get/get.dart';
import '../controller/collection_package.dart';

class ChatBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => ChatController());
  }
}