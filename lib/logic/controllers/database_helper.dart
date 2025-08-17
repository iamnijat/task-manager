import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import '../../data/models/task.dart';

class DatabaseHelper {
  Future<Database> database() async {
    return openDatabase(
      join(await getDatabasesPath(), 'todo.db'),
      onCreate: (db, version) async {
        await db.execute(
            "CREATE TABLE tasks(id INTEGER PRIMARY KEY, title TEXT, description TEXT)");
      },
      version: 1,
    );
  }

  Future<int> insertTask(Task task) async {
    int taskId = 0;
    Database _db = await database();
    await _db
        .insert('tasks', task.toMap(),
            conflictAlgorithm: ConflictAlgorithm.replace)
        .then((value) {
      taskId = value;
    });
    return taskId;
  }

  Future<void> updateTaskTitle(int id, String title) async {
    Database _db = await database();
    await _db.update(
      'tasks',
      {'title': title},
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  Future<void> updateTaskDescription(int id, String description) async {
    Database _db = await database();
    await _db.update(
      'tasks',
      {'description': description},
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  Future<List<Task>> getTasks() async {
    Database _db = await database();
    List<Map<String, dynamic>> taskMap = await _db.query('tasks');
    return List.generate(taskMap.length, (index) {
      return Task(
          id: taskMap[index]['id'],
          title: taskMap[index]['title'],
          description: taskMap[index]['description']);
    });
  }

  Future<void> deleteTask(int id) async {
    Database _db = await database();
    await _db.delete(
      'tasks',
      where: 'id = ?',
      whereArgs: [id],
    );
  }
}
