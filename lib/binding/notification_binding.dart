import 'package:get/get.dart';
import '../controller/collection_package.dart';

class NotificationBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => NotificationController());
  }
}