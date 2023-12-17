import 'package:flutter/foundation.dart' show immutable;
import 'package:todoapp/utils/utils.dart';

@immutable
class DBKeys {
  const DBKeys._();
  // static const String isDarkMode = 'isDarkMode';
  static const String dbName = 'task.db';
  static const String dbTable = 'tasks';
  static const String idColumn = TaskKeys.id;
  static const String titleColumn = TaskKeys.title;
  static const String categoryColumn = TaskKeys.category;
  static const String dateColumn = TaskKeys.date;
  static const String timeColumn = TaskKeys.time;
  static const String noteColumn = TaskKeys.note;
  static const String isCompletedColumn = TaskKeys.isCompleted;
}
