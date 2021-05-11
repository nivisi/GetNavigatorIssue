import 'package:get/get.dart';
import 'package:get_navigator_issue/controllers/home_controller.dart';
import 'package:get_navigator_issue/controllers/notes_controller.dart';
import 'package:get_navigator_issue/controllers/todos_controller.dart';

class InitialBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(HomeController());
    Get.put(NotesController());
    Get.put(TodosController());
  }
}
