import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_navigator_issue/app_routes.dart';
import 'package:get_navigator_issue/controllers/notes_controller.dart';

class NotesPage extends GetView<NotesController> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: controller.notes.length,
      itemBuilder: (_, index) {
        final item = controller.notes[index];
        return ListTile(
          title: Text(item.title),
          subtitle: Text(item.text),
          onTap: () {
            Get.toNamed(
              '${AppRoutes.notes}/${item.id}',
              id: AppRoutes.notesKey,
            );
          },
        );
      },
    );
  }
}
