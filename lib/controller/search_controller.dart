import 'package:get/get.dart';

class SearchController extends GetxController {
  final Rx<bool> _hasScrolled = Rx<bool>(false);
  bool get hasScrolled => _hasScrolled.value;

  set hasScrolledSet(bool value) {
    if (_hasScrolled.value != value) {
      _hasScrolled.value = value;
    }
  }
}
