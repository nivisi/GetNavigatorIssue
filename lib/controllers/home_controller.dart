import 'package:get/get.dart';

class HomeController extends GetxController {
  final _index = 0.obs;

  int get index => _index.value;

  void changeIndex(int value) {
    _index.value = value;
    update();
  }
}
