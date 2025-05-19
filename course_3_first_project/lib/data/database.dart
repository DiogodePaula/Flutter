import 'package:first_project/data/task_dao.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

Future<Database> getDataBase() async {
  final String path = await getDatabasesPath();
  final String pathWithName = join(path, 'task.db');

  return openDatabase(
    pathWithName,
    onCreate: (db, version) {
      db.execute(TaskDao.tableSql);
    },
    version: 1,
  );
}
