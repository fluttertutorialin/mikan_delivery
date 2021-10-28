import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class NotificationController extends GetxController {
  final Rx<bool> _hasScrolled = Rx<bool>(false);
  bool get hasScrolled => _hasScrolled.value;

  RefreshController refreshController =
      RefreshController(initialRefresh: false);

  @override
  void onInit() {
    super.onInit();
    dispatchFetch();
  }

  @override
  void onClose() {
    refreshController.dispose();
  }

  set hasScrolledSet(bool value) {
    if (_hasScrolled.value != value) {
      _hasScrolled.value = value;
    }
  }

  dispatchFetch() {
    refreshController.loadComplete();
    //_refreshController.loadFailed();
  }

  dispatchRefresh() {
    refreshController.requestLoading(needMove: true);
    refreshController.requestLoading(needMove: false);
  }
}
