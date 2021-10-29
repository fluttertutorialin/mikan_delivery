import 'package:extended_sliver/extended_sliver.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../resource/icon.dart';
import '../../resource/string_value.dart';
import '../../resource/app_color.dart';
import '../widget/form_button_widget.dart';
import '../../controller/collection_package.dart';
import '../../resource/screen.dart';

class OrderDetailPage extends GetView<OrderDetailController> {
  const OrderDetailPage({Key? key}) : super(key: key);

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
            child: CustomScrollView(slivers: [
              _buildHeader(),
              _customerDetail(),
              _orderDetail(),
              _orderDispatchDetail()
            ])));
  }

  _customerDetail() {
    return SliverPadding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 0.0),
        sliver: SliverToBoxAdapter(
            child: Card(
                color: Get.theme.backgroundColor,
                margin: const EdgeInsets.all(0.0),
                child: Padding(
                    padding: const EdgeInsets.only(
                        left: 16.0, right: 16.0, top: 16.0, bottom: 10.0),
                    child: Column(children: [
                      ListTile(
                          contentPadding: const EdgeInsets.all(0.0),
                          title: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      const Text('000000',
                                          style: TextStyle(fontSize: 15)),
                                      Container(
                                          padding: const EdgeInsets.only(
                                              left: 5, right: 5),
                                          margin:
                                              const EdgeInsets.only(left: 16.0),
                                          child: const Center(
                                              child: Text('27-11-2021 10:15 AM',
                                                  style: TextStyle(
                                                      fontSize: 12.0,
                                                      color: Colors.black))),
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(12.0),
                                              gradient: LinearGradient(
                                                  begin: Alignment.topLeft,
                                                  end: Alignment.bottomRight,
                                                  colors: [
                                                    Colors.grey
                                                        .withOpacity(0.1),
                                                    Colors.grey
                                                        .withOpacity(0.1),
                                                  ])))
                                    ]),
                                const Text('Lakhani kamlesh',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 14.0,
                                        height: 1.25)),
                                const SizedBox(height: 8.0),
                                const Text(
                                    'To. Ravani (Kuba) Ta. Visavadar Dis. Junagadh 362130',
                                    style: TextStyle(
                                        fontSize: 13.0,
                                        height: 1.25,
                                        fontWeight: FontWeight.w500)),
                                const SizedBox(height: 4.0),
                                Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      IconButton(
                                          icon: const Icon(mapIcon),
                                          color: Get.theme.secondaryHeaderColor,
                                          tooltip: 'Map',
                                          iconSize: 20.0,
                                          onPressed: () {}),
                                      IconButton(
                                          icon: const Icon(callIcon),
                                          color: Get.theme.secondaryHeaderColor,
                                          tooltip: 'Done',
                                          iconSize: 20.0,
                                          onPressed: () {}),
                                      IconButton(
                                          icon: const Icon(chatIcon),
                                          color: Get.theme.secondaryHeaderColor,
                                          tooltip: 'Chat',
                                          iconSize: 20.0,
                                          onPressed: () {})
                                    ])
                              ]),
                          leading: CircleAvatar(
                              backgroundColor:
                                  Get.theme.scaffoldBackgroundColor,
                              child: const Icon(personDetailIcon)))
                    ])))));
  }

  _orderDetail() {
    return SliverPadding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
        sliver: SliverToBoxAdapter(
            child: Card(
                color: Get.theme.backgroundColor,
                margin: const EdgeInsets.all(0.0),
                child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(children: [
                      ListTile(
                          contentPadding: const EdgeInsets.all(0.0),
                          title: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: const [
                                Text('Calzone',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 13.0,
                                        height: 1.25)),
                                SizedBox(height: 8.0),
                                Text('2 Items',
                                    style: TextStyle(
                                        fontSize: 13.0,
                                        height: 1.25,
                                        fontWeight: FontWeight.w500)),
                              ]),
                          trailing: const Text('Rs. 500'),
                          leading: CircleAvatar(
                              backgroundColor:
                                  Get.theme.scaffoldBackgroundColor,
                              child: const Icon(menuDetailIcon))),
                      const Divider(),
                      ListTile(
                          contentPadding: const EdgeInsets.all(0.0),
                          title: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: const [
                                Text('Calzone',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 14.0,
                                        height: 1.25)),
                                SizedBox(height: 8.0),
                                Text('2 Items',
                                    style: TextStyle(
                                        fontSize: 13.0,
                                        height: 1.25,
                                        fontWeight: FontWeight.w500)),
                              ]),
                          trailing: const Text('Rs. 500'),
                          leading: CircleAvatar(
                              backgroundColor:
                                  Get.theme.scaffoldBackgroundColor,
                              child: const Icon(menuDetailIcon))),
                      const Divider(),
                      ListTile(
                          contentPadding: const EdgeInsets.all(0.0),
                          title: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: const [
                                      Text('Service Tax',
                                          style: TextStyle(
                                              color: Colors.black54,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 14.0,
                                              height: 1.25)),
                                      SizedBox(width: 8.0),
                                      Text('Rs. 20',
                                          style: TextStyle(
                                              fontSize: 13.0,
                                              height: 1.25,
                                              fontWeight: FontWeight.w500)),
                                    ]),
                                const SizedBox(height: 8.0),
                                Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: const [
                                      Text('Total Amount',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 14.0,
                                              height: 1.25)),
                                      SizedBox(width: 8.0),
                                      Text('Rs. 1020',
                                          style: TextStyle(
                                              fontSize: 14.0,
                                              height: 1.25,
                                              fontWeight: FontWeight.w500)),
                                    ])
                              ])),
                    ])))));
  }

  _orderDispatchDetail() {
    return SliverPadding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 0.0),
        sliver: SliverToBoxAdapter(
            child: Card(
                color: Get.theme.backgroundColor,
                margin: const EdgeInsets.all(0.0),
                child: Padding(
                    padding: const EdgeInsets.only(
                        left: 16.0, right: 16.0, top: 16.0, bottom: 12.0),
                    child: Column(children: [
                      ListTile(
                          contentPadding: const EdgeInsets.all(0.0),
                          title: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: const [
                                Text('Total Items',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 13.0,
                                        height: 1.25)),
                                SizedBox(height: 8.0),
                                Text('4 Items',
                                    style: TextStyle(
                                        fontSize: 13.0,
                                        height: 1.25,
                                        fontWeight: FontWeight.w500))
                              ]),
                          leading: CircleAvatar(
                              backgroundColor:
                                  Get.theme.scaffoldBackgroundColor,
                              child: const Icon(totalItemDetailIcon))),
                      const Divider(),
                      ListTile(
                          contentPadding: const EdgeInsets.all(0.0),
                          title: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: const [
                                Text('Payment',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 14.0,
                                        height: 1.25)),
                                SizedBox(height: 8.0),
                                Text('Online',
                                    style: TextStyle(
                                        fontSize: 13.0,
                                        height: 1.25,
                                        fontWeight: FontWeight.w500)),
                              ]),
                          trailing: const Text('Success',
                              style: TextStyle(
                                  color: Colors.green,
                                  fontSize: 13.0,
                                  height: 1.25,
                                  fontWeight: FontWeight.w500)),
                          leading: CircleAvatar(
                              backgroundColor:
                                  Get.theme.scaffoldBackgroundColor,
                              child: const Icon(paymentSuccessDetailIcon))),
                      const Divider(),
                      ListTile(
                          contentPadding: const EdgeInsets.all(0.0),
                          title: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: const [
                                      FormButtonWidget(
                                          text: Text(dispatchButtonString,
                                              style: TextStyle(
                                                  color: whiteColor))),
                                      SizedBox(width: 20),
                                      FormButtonWidget(
                                          text: Text(cancelButtonString,
                                              style:
                                                  TextStyle(color: whiteColor)))
                                    ]),
                              ])),
                    ])))));
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
                left: 14.0,
                right: 16.0,
                bottom: 16.0),
            duration: const Duration(milliseconds: 240),
            child: Row(children: [
              GestureDetector(
                  child: const CircleAvatar(
                      radius: 14,
                      child: Icon(backAndroidIcon, size: 15)),
                  onTap: () {
                    FocusScope.of(Get.context!).requestFocus(FocusNode());
                    Get.back();
                  }),
              const SizedBox(width: 10),
              const Text(orderDetailTitleString)
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
