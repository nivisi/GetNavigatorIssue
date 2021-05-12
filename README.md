# Get Navigator Issue

This is a reproduction of the `GetNavigator` bug, [the issue is opened here](https://github.com/jonataslaw/getx/issues/1423).

## The problem

It would be nice to have an opportunity to use the `GetNavigator` for nested navigation. So it will be easier to extract the named navigation data and even initialize pages.

Although, when the `GetNavigator` is placed somewhere in the widget tree, [like here](https://github.com/nivisi/GetNavigatorIssue/blob/d50526f0431b2286aad0f186063ed0cffb8925b6/lib/pages/home_page.dart#L14-L55), the following bug occurs:

```dart
=[GETX] Route "/notes" not found

════════ Exception caught by widgets library ═══════════════════════════════════
Null check operator used on a null value
The relevant error-causing widget was
GetNavigator-[LabeledGlobalKey<NavigatorState>#13608]
lib/pages/home_page.dart:36
════════════════════════════════════════════════════════════════════════════════

════════ Exception caught by widgets library ═══════════════════════════════════
Multiple widgets used the same GlobalKey.
The key [LabeledGlobalKey<NavigatorState>#13608] was used by 2 widgets
    GetNavigator-[LabeledGlobalKey<NavigatorState>#13608]
    Navigator-[LabeledGlobalKey<NavigatorState>#13608]
        dirty
        dependencies: [UnmanagedRestorationScope, _EffectiveTickerMode]
        state: NavigatorState#6bd96(lifecycle state: initialized)
════════════════════════════════════════════════════════════════════════════════

```

## The expected behaviour

Is to actually use the `GetNavigator` and be able to navigate via nested navigators.

1. Create the navigator:

```dart
  GetNavigator(
      key: Get.nestedKey(AppRoutes.todosKey),
      initialRoute: AppRoutes.todos,
      getPages: [
        GetPage(
          name: AppRoutes.todos,
          page: () {
            return TodosPage();
          },
        ),
        GetPage(
          name: '${AppRoutes.todos}/:id',
          binding: TodoBinding(),
          page: () {
            return TodoPage();
          },
        ),
      ],
    ),
```

2. Navigate:
```dart
Get.toNamed('${AppRoutes.todos}/todoId');
```

3. Extract the data in the binding and put the controller:
```dart
class TodoBinding extends Bindings {
  @override
  void dependencies() {
    final text = Get.parameters['id'];
    Get.put(TodoController(todo));
  }
}
```

4. Use it:
```dart
class TodoController extends GetxController {
  final String id;
  Todo todo;

  TodoController(this.id);

  @override
  void onInit() {
    super.onInit();
    final todos = Get.find<TodosController>().todos;
    todo = todos.firstWhere(
      (item) => item.id == id,
    );
  }
}

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
```

This behaviour works well for the regular navigation. The `Test` button in the upper-right corner of the app bar reproduces it.

## The workaround

... is to use the simple Navigator and handle the upcoming "URL" parameters by ourselves. The parsing code could be better for sure, but let's leave it as is for this example.

```dart
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
```
