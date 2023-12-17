import 'package:todoapp/data/data.dart';

class TaskRepositoryImpl implements TaskRepo {
  final TaskDatabase _datasource;
  TaskRepositoryImpl(this._datasource);

  @override
  Future<void> addTask(Task task) async {
    try {
      await _datasource.addTask(task);
    } catch (e) {
      throw '$e';
    }
  }

  @override
  Future<void> deleteTask(Task task) async {
    try {
      await _datasource.deleteTask(task);
    } catch (e) {
      throw '$e';
    }
  }

  @override
  Future<List<Task>> getAllTasks() async {
    try {
      return await _datasource.getAllTasks();
    } catch (e) {
      throw '$e';
    }
  }

  @override
  Future<void> updateTask(Task task) async {
    try {
      await _datasource.updateTask(task);
    } catch (e) {
      throw '$e';
    }
  }
}
