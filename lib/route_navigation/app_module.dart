import 'package:get/get.dart';
import '../binding/collection_package.dart';
import '../ui/page/collection_package.dart';
import 'route.dart';

abstract class AppPage {
  static final List<GetPage> pages = [
    GetPage(
        name: firstLaunchRoute,
        page: () => const LoginPage()),
    GetPage(
        name: homeRoute,
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
    GetPage(
        name: profileEditRoute,
        binding: ProfileEditBinding(),
        page: () => const ProfileEditPage()),
    GetPage(
        name: chatRoute,
        binding: ChatBinding(),
        page: () => const ChatPage()),
  ];
}
