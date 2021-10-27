import 'package:get/get.dart';

class HomeController extends GetxController{
  final RxInt _selectIndexRx = RxInt(0);
  get selectIndex => _selectIndexRx.value;

  selectIndexItem(int index){
    _selectIndexRx.value = index;
  }
}