// ignore: file_names
import 'package:flutter/material.dart';
import 'package:todoapp/data/data.dart';
import 'package:todoapp/providers/providers.dart';
import 'package:todoapp/utils/utils.dart';
import 'widget.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DisplayList extends ConsumerWidget {
  const DisplayList(
      {super.key, required this.tasks, this.isCompletedTask = false});

  final List<Task> tasks;
  final bool isCompletedTask;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final sizes = context.deviceSize;
    final height = isCompletedTask ? sizes.height * 0.25 : sizes.height * 0.3;
    final emptyTaskMessage =
        isCompletedTask ? "Not completed task yet." : 'There is not task todo!';

    return CommonContainer(
      height: height,
      child: tasks.isEmpty
          ? Center(
              child: Text(
                emptyTaskMessage,
                style: context.textTheme.headlineSmall,
              ),
            )
          : ListView.separated(
              shrinkWrap: true,
              itemCount: tasks.length,
              padding: EdgeInsets.zero,
              itemBuilder: (ctx, index) {
                final task = tasks[index];
                return InkWell(
                  onLongPress: () {
                    AppAlerts.showAlertDeleteDialog(context, ref, task);
                  },
                  onTap: () async {
                    await showModalBottomSheet(
                        context: context,
                        builder: (ctx) {
                          return TaskDetails(task: task);
                        });
                  },
                  child: TaskTitle(
                    task: task,
                    onCompleted: (value) async {
                      await ref
                          .read(tasksProvider.notifier)
                          .updateTask(task)
                          .then((value) {
                        AppAlerts.displaySnackbar(
                            context,
                            task.isCompleted
                                ? "Task incompletd."
                                : "Task completed.");
                      });
                    },
                  ),
                );
              },
              separatorBuilder: (BuildContext context, int index) {
                return const Divider(
                  thickness: 1.5,
                );
              },
            ),
    );
  }
}
