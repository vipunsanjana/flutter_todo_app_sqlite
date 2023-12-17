// ignore: depend_on_referenced_packages
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todoapp/data/data.dart';
import 'package:todoapp/providers/providers.dart';

final tasksProvider = StateNotifierProvider<TaskNotify, TaskState>((ref) {
  final repository = ref.watch(taskRepositoryProvider);
  return TaskNotify(repository);
});
