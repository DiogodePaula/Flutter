import 'package:first_project/components/task.dart';
import 'package:first_project/data/database.dart';
import 'package:sqflite/sqflite.dart';

class TaskDao {
  static const String _tableName = 'task';
  static const String _name = 'name';
  static const String _image = 'image';
  static const String _difficulty = 'difficulty';

  static const String tableSql =
      'CREATE TABLE $_tableName ('
      'id INTEGER PRIMARY KEY AUTOINCREMENT, '
      '$_name TEXT, '
      '$_image TEXT, '
      '$_difficulty INTEGER'
      ')';

  save(Task task) async {
    final Database db = await getDataBase();
    var itemExists = await find(task.title);
    Map<String, dynamic> taskMap = toMap(task);

    if (itemExists.isEmpty) {
      await db.insert(_tableName, taskMap);
    } else {
      await db.update(
        _tableName,
        taskMap,
        where: '$_name = ?',
        whereArgs: [task.title],
      );
    }
  }

  Map<String, dynamic> toMap(Task task) {
    final Map<String, dynamic> mapTasks = {};
    mapTasks[_name] = task.title;
    mapTasks[_image] = task.imageSrc;
    mapTasks[_difficulty] = task.difficulty;

    return mapTasks;
  }

  Future<List<Task>> findAll() async {
    final Database db = await getDataBase();
    final List<Map<String, dynamic>> result = await db.query(_tableName);

    return toList(result);
  }

  List<Task> toList(List<Map<String, dynamic>> taskMap) {
    final List<Task> taskList = [];

    for (Map<String, dynamic> row in taskMap) {
      final Task task = Task(row[_name], row[_image], row[_difficulty]);
      taskList.add(task);
    }

    return taskList;
  }

  Future<List<Task>> find(String taskName) async {
    final Database db = await getDataBase();
    final List<Map<String, dynamic>> result = await db.query(
      _tableName,
      where: '$_name = ?',
      whereArgs: [taskName],
    );

    return toList(result);
  }

  delete(String taskName) async {
    final Database db = await getDataBase();
    await db.delete(_tableName, where: '$_name = ?', whereArgs: [taskName]);
  }
}
