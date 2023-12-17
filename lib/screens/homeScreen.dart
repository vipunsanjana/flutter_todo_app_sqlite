// ignore: file_names
// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:todoapp/config/config.dart';
import 'package:todoapp/providers/providers.dart';
import 'package:todoapp/utils/utils.dart';
import 'package:gap/gap.dart';
import 'package:todoapp/widgets/widget.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import '../data/data.dart';

class HomeScreen extends ConsumerWidget {
  static HomeScreen builder(
    BuildContext context,
    GoRouterState state,
  ) =>
      const HomeScreen();
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colors = context.colorScheme;
    final sizes = context.deviceSize;
    final taskState = ref.watch(tasksProvider);
    final inCompletedTasks = _incompltedTask(taskState.tasks, ref);
    final completedTasks = _compltedTask(taskState.tasks, ref);
    final selectedDate = ref.watch(dateProvider);
    final selectedTime = ref.watch(timeProvider);

    return Scaffold(
      body: Stack(
        children: [
          Column(
            children: [
              Container(
                height: sizes.height * 0.3,
                width: sizes.width,
                color: colors.primary,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: () => Helpers.selectDate(context, ref),
                      child: DisplayText(
                        text:
                            '${DateFormat.yMMMd().format(selectedDate)}\n\t\t\t\t\t\t\t\t'
                            '${selectedTime.format(context)}',
                        fontSize: 20,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                    const DisplayText(
                      text: "My ToDo List",
                      fontSize: 40,
                    ),
                    const Gap(20),
                  ],
                ),
              ),
            ],
          ),
          Positioned(
              top: 145,
              left: 0,
              right: 0,
              child: SafeArea(
                child: SingleChildScrollView(
                  physics: const AlwaysScrollableScrollPhysics(),
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      DisplayList(
                        tasks: inCompletedTasks,
                      ),
                      const Gap(20),
                      const Text(
                        "Completed Tasks",
                        style: TextStyle(
                          color: Colors.green,
                          fontSize: 26,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const Gap(20),
                      DisplayList(
                        tasks: completedTasks,
                        isCompletedTask: true,
                      ),
                      const Gap(20),
                      ElevatedButton(
                        onPressed: () => context.push(RouteLocation.createTask),
                        child: const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: DisplayText(text: "Add New Task")),
                      )
                    ],
                  ),
                ),
              ))
        ],
      ),
    );
  }

  List<Task> _compltedTask(List<Task> tasks, WidgetRef ref) {
    final date = ref.watch(dateProvider);
    final List<Task> filteredTask = [];

    for (var task in tasks) {
      if (task.isCompleted) {
        final isTaskDay = Helpers.isTaskFromSelectedDate(task, date);
        if (isTaskDay) {
          filteredTask.add(task);
        }
      }
    }
    return filteredTask;
  }

  List<Task> _incompltedTask(List<Task> tasks, WidgetRef ref) {
    final date = ref.watch(dateProvider);
    final List<Task> filteredTask = [];

    for (var task in tasks) {
      if (!task.isCompleted) {
        final isTaskDay = Helpers.isTaskFromSelectedDate(task, date);
        if (isTaskDay) {
          filteredTask.add(task);
        }
      }
    }
    return filteredTask;
  }
}
