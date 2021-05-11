import 'package:get/get.dart';
import 'package:get_navigator_issue/domain/todo.dart';

class TodosController extends GetxController {
  RxList<Todo> todos = [
    Todo('1', 'Important'),
    Todo('2', 'Very Important!'),
  ].obs;
}
