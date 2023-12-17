// ignore: depend_on_referenced_packages
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todoapp/data/data.dart';

final taskDatasourceProvider = Provider<TaskDatabase>((ref) {
  return TaskDatabase();
});
