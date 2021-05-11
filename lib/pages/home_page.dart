import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_navigator_issue/app_routes.dart';
import 'package:get_navigator_issue/bindings/note_binding.dart';
import 'package:get_navigator_issue/controllers/home_controller.dart';
import 'package:get_navigator_issue/controllers/todo_controller.dart';
import 'package:get_navigator_issue/pages/todos_page.dart';

import 'note_page.dart';
import 'notes_page.dart';
import 'todo_page.dart';

class HomePage extends GetView<HomeController> {
  final pages = [
    Navigator(
      key: Get.nestedKey(AppRoutes.todosKey),
      initialRoute: AppRoutes.todos,
      onGenerateRoute: (settings) {
        return GetPageRoute(
          settings: settings,
          page: () {
            if (settings.name == '/') {
              return Text('Initial');
            }
            if (settings.name == AppRoutes.todos) {
              return TodosPage();
            }
            final id = settings.name.replaceFirst(AppRoutes.todos + '/', '');
            Get.put(TodoController(id));

            return TodoPage();
          },
        );
      },
    ),
    GetNavigator(
      key: Get.nestedKey(AppRoutes.notesKey),
      initialRoute: AppRoutes.notes,
      getPages: [
        GetPage(
          name: AppRoutes.notes,
          page: () {
            return NotesPage();
          },
        ),
        GetPage(
          name: '${AppRoutes.notes}/:id',
          binding: NoteBinding(),
          page: () {
            return NotePage();
          },
        ),
      ],
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('GetNavigator Issue'),
        actions: [
          IconButton(
            onPressed: () {
              Get.toNamed('${AppRoutes.test}/ThisIsTheTest');
            },
            icon: Text('Test'),
          )
        ],
      ),
      bottomNavigationBar: GetBuilder(
        init: controller,
        builder: (controller) => BottomNavigationBar(
          currentIndex: controller.index,
          onTap: controller.changeIndex,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.today),
              label: 'Todos',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.note),
              label: 'Notes',
            ),
          ],
        ),
      ),
      body: GetBuilder(
        init: controller,
        builder: (controller) => IndexedStack(
          children: pages,
          index: controller.index,
        ),
      ),
      // body: GetBuilder(
      //   init: controller,
      //   builder: (controller) {
      //     return IndexedStack(
      //       children: pages,
      //       index: controller.index,
      //     );
      //   },
      // ),
    );
  }
}
