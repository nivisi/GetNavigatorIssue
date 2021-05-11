import 'package:get/get.dart';
import 'package:get_navigator_issue/controllers/note_controller.dart';

class NoteBinding extends Bindings {
  @override
  void dependencies() {
    final id = Get.parameters['id'];
    Get.put(NoteController(id));
  }
}
