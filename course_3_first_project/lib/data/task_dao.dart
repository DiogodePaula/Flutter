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

  save(Task task) async {}
  Future<List<Task>> findAll() async {}
  Future<List<Task>> find(String taskName) async {}
  delete(String taskName) async {}
}
