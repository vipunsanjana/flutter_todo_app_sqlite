import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:todoapp/providers/providers.dart';
import 'package:todoapp/widgets/widget.dart';
// ignore: depend_on_referenced_packages
import 'package:gap/gap.dart';
// ignore: depend_on_referenced_packages
import 'package:flutter_riverpod/flutter_riverpod.dart';
// ignore: depend_on_referenced_packages
import 'package:intl/intl.dart';
import '../utils/utils.dart';

class SelectDateAndTime extends ConsumerWidget {
  const SelectDateAndTime({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final time = ref.watch(timeProvider);
    final date = ref.watch(dateProvider);

    return Row(
      children: [
        Expanded(
            child: CommonText(
          title: "Date",
          hintText: DateFormat.yMMMd().format(date),
          readOnly: true,
          suffixIcon: IconButton(
              onPressed: () {
                Helpers.selectDate(context, ref);
              },
              icon: const FaIcon(FontAwesomeIcons.calendar)),
        )),
        const Gap(10),
        Expanded(
            child: CommonText(
          title: "Time",
          hintText: Helpers.timeToString(time),
          readOnly: true,
          suffixIcon: IconButton(
              onPressed: () {
                _selectTime(context, ref);
              },
              icon: const FaIcon(FontAwesomeIcons.clock)),
        )),
      ],
    );
  }

  void _selectTime(BuildContext context, WidgetRef ref) async {
    TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (pickedTime != null) {
      ref.read(timeProvider.notifier).state = pickedTime;
    }
  }
}
