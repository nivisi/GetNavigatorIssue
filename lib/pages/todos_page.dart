import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_navigator_issue/controllers/todos_controller.dart';

import '../app_routes.dart';

class TodosPage extends GetView<TodosController> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: controller.todos.length,
      itemBuilder: (_, index) {
        final item = controller.todos[index];
        return ListTile(
          title: Text(item.title),
          onTap: () {
            Get.toNamed(
              '${AppRoutes.todos}/${item.id}',
              id: AppRoutes.todosKey,
            );
          },
        );
      },
    );
  }
}
