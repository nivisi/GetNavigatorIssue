import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_navigator_issue/controllers/todo_controller.dart';

class TodoPage extends GetView<TodoController> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('TODO: ${controller.todo.title}'),
        BackButton(),
      ],
    );
  }
}
