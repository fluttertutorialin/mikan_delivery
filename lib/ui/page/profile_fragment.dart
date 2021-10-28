import 'package:extended_sliver/extended_sliver.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controller/collection_package.dart';
import '../../resource/screen.dart';

class ProfileFragment extends GetView<ListController> {
  const ProfileFragment({Key? key}) : super(key: key);

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
            child: CustomScrollView(
                slivers: [_buildHeader(), _dashboard()])));
  }

  _dashboard() {
    return SliverPadding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 0.0),
        sliver: SliverToBoxAdapter(
            child: Container(
                padding: const EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                    color: Get.theme.backgroundColor,
                    borderRadius:
                        const BorderRadius.all(Radius.circular(16.0))),
                child: Column(children: [
                   CircleAvatar(
                      backgroundColor: Colors.grey.withOpacity(0.1),
                      radius: 50, backgroundImage: const ExactAssetImage('assets/images/user_profile.png')),
                  const SizedBox(height: 20),
                  Card(
                      child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Icon(FluentIcons.question_24_regular),
                                const SizedBox(width: 10),
                                Expanded(
                                    flex: 1,
                                    child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: const [
                                          Text('Cancel',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 16.0,
                                                  height: 1.25)),
                                          SizedBox(height: 3),
                                          Text('Customer not reply, not home',
                                              style: TextStyle(color: Colors.grey,
                                                  fontSize: 12.0, height: 1.25))
                                        ])),
                                const SizedBox(width: 10),
                                const Text('00', style: TextStyle(color: Colors.red,
                                    fontSize: 18.0, height: 1.25))
                              ]))),
                  const SizedBox(height: 16),
                  Card(
                      child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Icon(FluentIcons.note_24_regular),
                                const SizedBox(width: 10),
                                Expanded(
                                    flex: 1,
                                    child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: const [
                                          Text('Pick Up',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 16.0,
                                                  height: 1.25)),
                                          SizedBox(height: 3),
                                          Text('Free mind to collect order',
                                              style: TextStyle(color: Colors.grey,
                                                  fontSize: 12.0, height: 1.25))
                                        ])),
                                const SizedBox(width: 10),
                                const Text('00', style: TextStyle(color: Colors.orange,
                                    fontSize: 18.0, height: 1.25))
                              ]))),
                  const SizedBox(height: 16),
                  Card(
                      child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Icon(FluentIcons.time_picker_24_regular),
                                const SizedBox(width: 10),
                                Expanded(
                                    flex: 1,
                                    child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: const [
                                          Text('Dispatch',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 16.0,
                                                  height: 1.25)),
                                          SizedBox(height: 3),
                                          Text('Customer is available order successful dispatch',
                                              style: TextStyle(color: Colors.grey,
                                                  fontSize: 12.0, height: 1.25))
                                        ])),
                                const SizedBox(width: 10),
                                const Text('00', style: TextStyle(color: Colors.brown,
                                    fontSize: 18.0, height: 1.25))
                              ]))),
                  const SizedBox(height: 16),
                  Card(
                      child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Icon(FluentIcons.phone_update_24_regular),
                                const SizedBox(width: 10),
                                Expanded(
                                    flex: 1,
                                    child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: const [
                                          Text('Earning',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 16.0,
                                                  height: 1.25)),
                                          SizedBox(height: 3),
                                          Text('Get the bonus, salary, winner etc.',
                                              style: TextStyle(color: Colors.grey,
                                                  fontSize: 12.0, height: 1.25))
                                        ])),
                                const SizedBox(width: 10),
                                const Text('00', style: TextStyle(color: Colors.green,
                                    fontSize: 18.0, height: 1.25))
                              ]))),
                ]))));
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
            child: Row(children: const <Widget>[Text('Dashboard')]))));
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
