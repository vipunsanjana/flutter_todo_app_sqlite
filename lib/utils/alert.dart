// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todoapp/data/data.dart';
import 'package:todoapp/providers/providers.dart';
import 'package:go_router/go_router.dart';
import 'package:todoapp/utils/utils.dart';

@immutable
class AppAlerts {
  const AppAlerts._();

  static displaySnackbar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          message,
          style: context.textTheme.headlineSmall?.copyWith(
            color: context.colorScheme.surface,
          ),
        ),
        backgroundColor: context.colorScheme.primary,
        behavior: SnackBarBehavior.floating, // Show the SnackBar at the top
      ),
    );
  }

  static Future<void> showAlertDeleteDialog(
    BuildContext context,
    WidgetRef ref,
    Task task,
  ) async {
    Widget cancelButton = TextButton(
      child: const Text('NO'),
      onPressed: () => context.pop(),
    );
    Widget deleteButton = TextButton(
      onPressed: () async {
        await ref.read(tasksProvider.notifier).deleteTask(task).then(
          (value) {
            displaySnackbar(
              context,
              'Task deleted successfully',
            );
            context.pop();
          },
        );
      },
      child: const Text('YES'),
    );

    AlertDialog alert = AlertDialog(
      title: const Text('Are you sure you want to delete this task?'),
      actions: [
        deleteButton,
        cancelButton,
      ],
    );

    await showDialog(
      context: context,
      builder: (ctx) {
        return alert;
      },
    );
  }
}
