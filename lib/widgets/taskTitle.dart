// ignore: file_names
import 'package:flutter/material.dart';
import 'package:todoapp/utils/extentions.dart';
import 'package:todoapp/widgets/widget.dart';
import '../data/data.dart';
// ignore: depend_on_referenced_packages
import 'package:gap/gap.dart';

class TaskTitle extends StatelessWidget {
  const TaskTitle({super.key, required this.task, this.onCompleted});

  final Task task;
  final Function(bool?)? onCompleted;

  @override
  Widget build(BuildContext context) {
    final style = context.textTheme;
    final fontWeight = task.isCompleted ? FontWeight.normal : FontWeight.bold;
    final double iconOpacity = task.isCompleted ? 0.3 : 0.5;
    final backgroundOpacity = task.isCompleted ? 0.1 : 0.3;
    final textDecoration =
        task.isCompleted ? TextDecoration.lineThrough : TextDecoration.none;

    return Padding(
      padding: const EdgeInsets.only(
        left: 15,
        top: 15,
        bottom: 10,
      ),
      child: Row(
        children: [
          CircleContainer(
            color: task.category.color.withOpacity(backgroundOpacity),
            borderColor: null,
            child: Center(
              child: Icon(
                task.category.icon,
                color: task.category.color.withOpacity(iconOpacity),
              ),
            ),
          ),
          const Gap(16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  task.title,
                  style: style.titleMedium?.copyWith(
                    decoration: textDecoration,
                    fontSize: 20,
                    fontWeight: fontWeight,
                  ),
                ),
                Text(
                  task.time,
                  style: style.titleMedium?.copyWith(
                    decoration: textDecoration,
                  ),
                ),
              ],
            ),
          ),
          Checkbox(
            value: task.isCompleted,
            onChanged: onCompleted,
          ),
        ],
      ),
    );
  }
}
