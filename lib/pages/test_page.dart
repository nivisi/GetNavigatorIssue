import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_navigator_issue/controllers/test_controller.dart';

class TestPage extends GetView<TestController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Test'),
      ),
      body: Center(child: Text(controller.text)),
    );
  }
}
