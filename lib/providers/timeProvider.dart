import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:flutter_riverpod/flutter_riverpod.dart';

final timeProvider = StateProvider.autoDispose<TimeOfDay>((ref) {
  return TimeOfDay.now();
});
