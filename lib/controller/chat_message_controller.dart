import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../ui/widget/chat_message_item_view.dart';

class ChatMessageController extends GetxController
    with SingleGetTickerProviderMixin {
  final Rx<bool> _hasScrolled = Rx<bool>(false);
  bool get hasScrolled => _hasScrolled.value;

  Rx<List<ChatMessageItemView>> chatMessageListRx = Rx<List<ChatMessageItemView>>([]);
  List<ChatMessageItemView> chatMessageList = [];

  AnimationController? animationController;

  @override
  void onInit() {
    super.onInit();
    animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 0));

    var chatMessageItemView = ChatMessageItemView(message: 'Order get the successful. Thank You!.', uid: '1', animationController: animationController!);
    chatMessageList.add(chatMessageItemView);
    chatMessageList.add(chatMessageItemView);
    chatMessageList.add(chatMessageItemView);
    chatMessageList.add(chatMessageItemView);
    chatMessageList.add(chatMessageItemView);

    chatMessageItemView.animationController.forward();
    chatMessageListRx.value = chatMessageList;
  }

  set hasScrolledSet(bool value) {
    if (_hasScrolled.value != value) {
      _hasScrolled.value = value;
    }
  }

  addNewMessage() {
    animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 400));

    var chatMessageItemView = ChatMessageItemView(message: 'New order get the successful. Thank You!.', uid: '1', animationController: animationController!);
    chatMessageList.insert(chatMessageListRx.value.length, chatMessageItemView);
    chatMessageItemView.animationController.forward();
    chatMessageListRx.value = chatMessageList.obs;
  }
}
