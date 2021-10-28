import 'package:get/get.dart';
import '../controller/collection_package.dart';

class OrderDetailBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => OrderDetailController());
  }
}