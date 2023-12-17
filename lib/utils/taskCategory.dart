// ignore_for_file: file_names

import 'package:flutter/material.dart';

enum TaskCategory {
  education(Icons.school, Colors.blueGrey),
  health(Icons.favorite, Colors.orange),
  home(Icons.home, Colors.green),
  others(Icons.calendar_month_rounded, Colors.purple),
  personal(Icons.person, Colors.lightBlue),
  shopping(Icons.shopping_bag, Colors.deepOrange),
  social(Icons.people, Colors.brown),
  travel(Icons.flight, Colors.pink),
  work(Icons.work, Colors.amber),
  sleep(Icons.bed, Colors.lightBlueAccent),
  eat(Icons.food_bank, Color.fromARGB(255, 255, 89, 89));

  static TaskCategory stringToTaskCategory(String value) {
    try {
      return TaskCategory.values
          .firstWhere((category) => category.name == value);
    } catch (e) {
      return TaskCategory.others;
    }
  }

  final IconData icon;
  final Color color;
  const TaskCategory(this.icon, this.color);
}
