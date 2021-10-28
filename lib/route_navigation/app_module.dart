import 'package:get/get.dart';
import '../binding/collection_package.dart';
import '../ui/page/collection_package.dart';
import 'route.dart';

abstract class AppPage {
  static final List<GetPage> pages = [
    GetPage(
        name: firstLaunchRoute,
        binding: HomeBinding(),
        page: () => const HomePage()),
    GetPage(
        name: orderDetailRoute,
        binding: OrderDetailBinding(),
        page: () => const OrderDetailPage()),
    GetPage(
        name: notificationRoute,
        binding: NotificationBinding(),
        page: () => const NotificationPage()),
    GetPage(
        name: changePasswordRoute,
        binding: ChangePasswordBinding(),
        page: () => const ChangePasswordPage()),
  ];
}
