import 'package:extended_sliver/extended_sliver.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mikan/resource/icon.dart';
import '../../resource/string_value.dart';
import '../../resource/app_color.dart';
import '../widget/form_button_widget.dart';
import '../widget/text_field_component.dart';
import '../../controller/collection_package.dart';
import '../../resource/screen.dart';

class ProfileEditPage extends GetView<ProfileEditController> {
  const ProfileEditPage({Key? key}) : super(key: key);

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
                slivers: [_buildHeader(), _changePasswordForm()])));
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
                child: Column(children: [
                  CircleAvatar(
                      radius: 50,
                      backgroundColor: Colors.grey.withOpacity(0.1),
                      backgroundImage: const ExactAssetImage(
                          'assets/images/user_profile.png')),
                  const SizedBox(height: 20),
                  const TextFieldComponent(
                      hintText: nameHintString,
                      suffixIcon: Icon(nameTextFieldIcon)),
                  const SizedBox(height: 16),
                  const TextFieldComponent(
                      hintText: emailHintString,
                      suffixIcon: Icon(emailTextFieldIcon)),
                  const SizedBox(height: 16),
                  const TextFieldComponent(
                      hintText: mobileHintString,
                      suffixIcon: Icon(callTextFieldIcon)),
                  const SizedBox(height: 16),
                  const TextFieldComponent(
                      hintText: addressHintString,
                      suffixIcon: Icon(addressTextFieldIcon)),
                  const SizedBox(height: 16),
                  const FormButtonWidget(
                      text: Text(profileEditButtonString,
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
                      radius: 14, child: Icon(backAndroidIcon, size: 15)),
                  onTap: () {
                    FocusScope.of(Get.context!).requestFocus(FocusNode());
                    Get.back();
                  }),
              const SizedBox(width: 10),
              const Text(profileEditTitleString)
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
