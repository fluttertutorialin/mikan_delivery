import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChatMessageController extends GetxController
    with SingleGetTickerProviderMixin {
  final Rx<bool> _hasScrolled = Rx<bool>(false);
  bool get hasScrolled => _hasScrolled.value;

  AnimationController? animationController;

  @override
  void onInit() {
    super.onInit();
    animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 400));
  }

  set hasScrolledSet(bool value) {
    if (_hasScrolled.value != value) {
      _hasScrolled.value = value;
    }
  }
}
