import 'package:extended_sliver/extended_sliver.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mikan/resource/app_color.dart';
import 'package:mikan/ui/widget/form_button_widget.dart';
import '../widget/text_field_component.dart';
import '../../controller/collection_package.dart';
import '../../resource/screen.dart';

class SearchFragment extends GetView<ListController> {
  const SearchFragment({Key? key}) : super(key: key);

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
            child: CustomScrollView(slivers: [_buildHeader(), _searchForm()])));
  }

  _searchForm() {
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
                      hintText: 'Order Id',
                      suffixIcon: Icon(FluentIcons.app_generic_24_regular)),
                  SizedBox(height: 16),
                  TextFieldComponent(
                      hintText: 'Name',
                      suffixIcon: Icon(FluentIcons.person_24_regular)),
                  SizedBox(height: 16),
                  TextFieldComponent(
                      hintText: 'Email',
                      suffixIcon: Icon(FluentIcons.call_24_regular)),
                  SizedBox(height: 16),
                  TextFieldComponent(
                      hintText: 'Mobile',
                      suffixIcon: Icon(FluentIcons.call_24_regular)),
                  SizedBox(height: 16),
                  TextFieldComponent(
                      hintText: 'Address',
                      suffixIcon: Icon(FluentIcons.location_24_regular)),
                  SizedBox(height: 16),
                  TextFieldComponent(
                      hintText: 'Order date',
                      suffixIcon: Icon(FluentIcons.time_picker_24_regular)),
                  SizedBox(height: 16),
                  TextFieldComponent(
                      hintText: 'Dispatch date',
                      suffixIcon: Icon(FluentIcons.time_picker_24_regular)),
                  SizedBox(height: 16),
                  FormButtonWidget(
                      text: Text('SEARCH ORDER',
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
            child: Row(children: const <Widget>[Text('Search')]))));
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
