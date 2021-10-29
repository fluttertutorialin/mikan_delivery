import 'package:extended_sliver/extended_sliver.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../resource/icon.dart';
import '../../resource/string_value.dart';
import '../../route_navigation/route.dart';
import '../../controller/collection_package.dart';
import '../../resource/screen.dart';
import '../widget/tap_scale_container.dart';

class ChatPage extends GetView<ChatController> {
  const ChatPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: NotificationListener(
            onNotification: (notification) {
              if (notification is OverscrollIndicatorNotification) {
                notification.disallowGlow();
              } else if (notification is ScrollUpdateNotification) {
                if (notification.depth == 0) {
                  final double offset = notification.metrics.pixels;
                  controller.hasScrolledSet = offset > 0.0;
                }
              }
              return true;
            },
            child: CustomScrollView(slivers: [_buildHeader(), _buildList()])));
  }

  _buildList() {
    return SliverPadding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 0.0),
        sliver: SliverList(
            delegate: SliverChildBuilderDelegate((context, index) {
          return Container(
              margin: const EdgeInsets.only(top: 8, bottom: 8),
              child: TapScaleContainer(
                  onTap: () {},
                  decoration: BoxDecoration(
                      color: Get.theme.backgroundColor,
                      borderRadius:
                          const BorderRadius.all(Radius.circular(16.0))),
                  child: Padding(
                      padding: const EdgeInsets.only(
                          left: 16.0, right: 16.0, top: 16.0, bottom: 16.0),
                      child: Row(children: <Widget>[
                        CircleAvatar(
                            backgroundColor: Colors.grey.withOpacity(0.1),
                            radius: 20,
                            backgroundImage: const ExactAssetImage(
                                'assets/images/user_profile.png')),
                        const SizedBox(width: 10),
                        Expanded(
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: const [
                              Text('Lakhani Kamlesh',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14.0,
                                      height: 1.25)),
                              SizedBox(height: 4),
                              Text('Order get the successful, Thank You!',
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style:
                                      TextStyle(fontSize: 12.0, height: 1.25))
                            ])),
                        CircleAvatar(
                            backgroundColor: Get.theme.scaffoldBackgroundColor,
                            child: const Text('0',
                                style: TextStyle(
                                    fontSize: 14.0,
                                    height: 1.25)))
                      ]))));
        }, childCount: 5)));
  }

  _buildHeader() {
    return SliverPinnedToBoxAdapter(
        child: Obx(() => AnimatedContainer(
            decoration: BoxDecoration(
                color: controller.hasScrolled
                    ? Get.theme.backgroundColor
                    : Get.theme.scaffoldBackgroundColor,
                borderRadius: scrollHeaderBorderRadius(controller.hasScrolled),
                boxShadow: scrollHeaderBoxShadow(controller.hasScrolled)),
            padding: EdgeInsets.only(
                top: 16.0 + Screen.statusBarHeight,
                left: 16.0,
                right: 16.0,
                bottom: 16.0),
            duration: const Duration(milliseconds: 240),
            child: Row(children: [
              GestureDetector(
                  child: const CircleAvatar(
                      radius: 14, child: Icon(backAndroidIcon, size: 15)),
                  onTap: () {
                    FocusScope.of(Get.context!).requestFocus(FocusNode());
                    Get.back();
                  }),
              const SizedBox(width: 10),
              const Text(chatTitleString)
            ]))));
  }

  BorderRadius scrollHeaderBorderRadius(final bool hasScrolled) => hasScrolled
      ? const BorderRadius.only(
          bottomLeft: Radius.circular(16.0), bottomRight: Radius.circular(16.0))
      : BorderRadius.zero;

  List<BoxShadow> scrollHeaderBoxShadow(final bool hasScrolled) => hasScrolled
      ? [
          BoxShadow(
              color: Colors.black.withOpacity(0.024),
              offset: const Offset(0, 1),
              blurRadius: 3.0,
              spreadRadius: 3.0)
        ]
      : const [];
}
