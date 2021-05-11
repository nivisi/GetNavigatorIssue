import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_navigator_issue/controllers/note_controller.dart';

class NotePage extends GetView<NoteController> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(controller.note.title),
        Text(controller.note.text),
      ],
    );
  }
}
