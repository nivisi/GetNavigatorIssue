import 'package:get/get.dart';
import 'package:get_navigator_issue/domain/note.dart';

class NotesController extends GetxController {
  RxList<Note> notes = [
    Note('1', 'First', 'Useful note'),
    Note('2', 'Second', 'Not very useful note'),
  ].obs;
}
