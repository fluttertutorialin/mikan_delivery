import 'package:get/get.dart';
import '../ui/page/collection_package.dart';
import '../binding/home_binding.dart';
import 'route.dart';

abstract class AppPage {
  static final List<GetPage> pages = [
    GetPage(
        name: firstLaunchRoute,
        binding: HomeBinding(),
        page: () => const HomePage()),

  ];
}
