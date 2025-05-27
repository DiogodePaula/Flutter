import 'package:first_project/components/task.dart';
import 'package:flutter/widgets.dart';

class TaskInherited extends InheritedWidget {
  TaskInherited({super.key, required super.child});

  final List<Task> taskList = [
    Task('Aprender Flutter', 'assets/images/flutter.png', 3),
    Task('Ler', 'assets/images/book.jpg', 2),
    Task('Jogar', 'assets/images/game.jpg', 1),
  ];

  void newTask(String name, String image, int difficulty) {
    taskList.add(Task(name, image, difficulty));
  }

  static TaskInherited of(BuildContext context) {
    final TaskInherited? result =
        context.dependOnInheritedWidgetOfExactType<TaskInherited>();

    assert(result != null, 'No TaskInherited found in context');

    return result!;
  }

  @override
  bool updateShouldNotify(TaskInherited oldWidget) {
    return oldWidget.taskList.length != taskList.length;
    // quando a versão anterior é diferente da atual, retorna true e notifica o widget pai
  }
}
