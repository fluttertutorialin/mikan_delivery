import 'package:get/get.dart';
import '../controller/collection_package.dart';

class HomeBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => HomeController());

    Get.lazyPut(() => DispatchOrderController());
    Get.lazyPut(() => SearchController());
    Get.lazyPut(() => DashboardController());
    Get.lazyPut(() => SettingController());
  }
}