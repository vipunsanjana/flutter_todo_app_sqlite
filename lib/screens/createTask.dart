// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:todoapp/utils/utils.dart';
import 'package:todoapp/widgets/widget.dart';
import 'package:go_router/go_router.dart';
import 'package:gap/gap.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import '../config/routes/routes.dart';
import '../data/models/models.dart';
import '../providers/providers.dart';

class CreateTask extends ConsumerStatefulWidget {
  static CreateTask builder(
    BuildContext context,
    GoRouterState state,
  ) =>
      const CreateTask();
  const CreateTask({super.key});

  @override
  ConsumerState<CreateTask> createState() => _CreateTaskState();
}

class _CreateTaskState extends ConsumerState<CreateTask> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _noteController = TextEditingController();

  @override
  void dispose() {
    _titleController.dispose();
    _noteController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colors = context.colorScheme;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: colors.primary,
        title: const DisplayText(
          text: 'Add New Task',
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              CommonText(
                title: "Task Title",
                hintText: "Task Title",
                controller: _titleController,
              ),
              const Gap(10),
              const SelectCategory(),
              const Gap(10),
              const SelectDateAndTime(),
              const Gap(10),
              CommonText(
                title: "Note",
                hintText: "Task Note",
                maxLines: 6,
                controller: _noteController,
              ),
              const Gap(50),
              ElevatedButton(
                onPressed: _createTask,
                child: const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: DisplayText(
                    text: 'Save',
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _createTask() async {
    final title = _titleController.text.trim();
    final note = _noteController.text.trim();
    final time = ref.watch(timeProvider);
    final date = ref.watch(dateProvider);
    final category = ref.watch(categoryProvider);
    if (title.isNotEmpty) {
      final task = Task(
        title: title,
        category: category,
        time: Helpers.timeToString(time),
        date: DateFormat.yMMMd().format(date),
        note: note,
        isCompleted: false,
      );

      await ref.read(tasksProvider.notifier).createTask(task).then((value) {
        AppAlerts.displaySnackbar(context, 'Task create successfully');
        context.go(RouteLocation.home);
      });
      //print(task.isCompleted);
    } else {
      AppAlerts.displaySnackbar(context, 'Title cannot be empty');
    }
  }
}
