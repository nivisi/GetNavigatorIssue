import 'package:get/get.dart';
import 'package:get_navigator_issue/controllers/test_controller.dart';

class TestBinding extends Bindings {
  @override
  void dependencies() {
    final text = Get.parameters['text'];
    Get.put(TestController(text));
  }
}
