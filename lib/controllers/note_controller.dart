import 'package:get/get.dart';
import 'package:get_navigator_issue/controllers/notes_controller.dart';
import 'package:get_navigator_issue/domain/note.dart';

class NoteController extends GetxController {
  final String id;
  Note note;

  NoteController(this.id);

  @override
  void onInit() {
    super.onInit();

    note = Get.find<NotesController>().notes.firstWhere(
          (item) => item.id == id,
        );
  }
}
