import 'package:extended_sliver/extended_sliver.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../resource/app_color.dart';
import '../widget/form_button_widget.dart';
import '../widget/text_field_component.dart';
import '../../controller/collection_package.dart';
import '../../resource/screen.dart';

class ChangePasswordPage extends GetView<ChangePasswordController> {
  const ChangePasswordPage({Key? key}) : super(key: key);

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
            child: CustomScrollView(slivers: [_buildHeader(), _changePasswordForm()])));
  }

  _changePasswordForm() {
    return SliverPadding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 0.0),
        sliver: SliverToBoxAdapter(
            child: Container(
                padding: const EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                    color: Get.theme.backgroundColor,
                    borderRadius:
                        const BorderRadius.all(Radius.circular(16.0))),
                child: Column(children: const [
                  TextFieldComponent(
                      hintText: 'Current password',
                      suffixIcon: Icon(FluentIcons.eye_hide_24_regular)),
                  SizedBox(height: 16),
                  TextFieldComponent(
                      hintText: 'New password',
                      suffixIcon: Icon(FluentIcons.eye_hide_24_regular)),
                  SizedBox(height: 16),
                  TextFieldComponent(
                      hintText: 'New confirm password',
                      suffixIcon: Icon(FluentIcons.eye_hide_24_regular)),
                  SizedBox(height: 16),
                  FormButtonWidget(
                      text: Text('CHANGE PASSWORD',
                          style: TextStyle(color: whiteColor)))
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
            child: Row(children: [
              GestureDetector(
                  child: const CircleAvatar(
                      radius: 14,
                      child: Icon(FluentIcons.arrow_left_24_regular, size: 15)),
                  onTap: () {
                    FocusScope.of(Get.context!).requestFocus(FocusNode());
                    Get.back();
                  }),
              const SizedBox(width: 10),
              const Text('Chnage password')
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
