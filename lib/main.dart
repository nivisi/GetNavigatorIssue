import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_navigator_issue/bindings/test_binding.dart';
import 'package:get_navigator_issue/pages/home_page.dart';
import 'package:get_navigator_issue/pages/test_page.dart';

import 'app_routes.dart';
import 'bindings/initial_binding.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      initialBinding: InitialBinding(),
      getPages: [
        GetPage(
          name: '/',
          page: () => HomePage(),
        ),
        GetPage(
          name: '${AppRoutes.test}/:text',
          page: () => TestPage(),
          binding: TestBinding(),
        ),
      ],
    );
  }
}
