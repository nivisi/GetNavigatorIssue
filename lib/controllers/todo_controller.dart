import 'package:get/get.dart';
import 'package:get_navigator_issue/controllers/todos_controller.dart';
import 'package:get_navigator_issue/domain/todo.dart';

class TodoController extends GetxController {
  final String id;
  Todo todo;

  TodoController(this.id);

  @override
  void onInit() {
    super.onInit();
    final todos = Get.find<TodosController>().todos;
    todo = todos.firstWhere(
      (item) => item.id == id,
    );
  }
}
