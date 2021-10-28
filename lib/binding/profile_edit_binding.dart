import 'package:get/get.dart';
import '../controller/collection_package.dart';

class ProfileEditBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => ProfileEditController());
  }
}